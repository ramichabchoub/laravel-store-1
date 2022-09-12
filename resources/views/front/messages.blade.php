<x-front-layout>

    <h2>Messages</h2>

    <div class="row">
        <div class="col-md-3">

        </div>
        <div class="col-md-9">
            <div id="messages" class="bg-light rounded" style="height:33vh; overflow-y:scroll;">

            </div>
            <form id="msgForm" action="{{ route('messages.peer', 7) }}" method="post">
                @csrf
                <input type="text" name="message" class="form-control">
                <button class="btn btn-primary">Send</button>
            </form>
        </div>
    </div>

</x-front-layout>