Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACD6591643
	for <lists+linux-omap@lfdr.de>; Sun, 18 Aug 2019 12:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726641AbfHRKxP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 18 Aug 2019 06:53:15 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34210 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbfHRKxP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 18 Aug 2019 06:53:15 -0400
Received: by mail-wr1-f65.google.com with SMTP id s18so5752493wrn.1
        for <linux-omap@vger.kernel.org>; Sun, 18 Aug 2019 03:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mn0/40nGtsUo2sN2YIw9csG972CA1XynNu3U+6JTsm0=;
        b=CCa3VEV9nHAUmx9d68iWDWylBayK+lIy9Fl8HxkaDXZXvQ5XEignxTOAdpmhokSt1v
         yejAXT8PPiFVIAw2v+9OgCmaz9L7Xc9KTXC1kiu+pEFKgIbau4pSd1mYju6fbP2aZbZS
         hEGsPfzVDGLJ/zhsk83x0Fjke5qBo8+mU2IGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mn0/40nGtsUo2sN2YIw9csG972CA1XynNu3U+6JTsm0=;
        b=YGkROXss4fLoI5vLnh2szVJ6LCB892QowVPlrBc4pNo1Fi0c84PmKP2QQFYy6KgP0V
         14yMw/u1br0wv0gUS5b7GKc4zg34Aj21yj7YTZlKC4OUY1aNGJm6qbErLD0zO3G/UsM2
         1PEapzcR/MUOBXA/00bBq+s18iRSI0WNYsSLtGPHK6O4NlWaYkXlihhx1kYdkJztYGYN
         Io6nMnl8ZaRYcU5nUF1i/UxxFzimWQ4ItlM+r1XDyAvQa1UmOJHeTTmkDPuySWJpnWs5
         t+B5R4RlZ10DCZjTux7ibU81uj2Db68e9dfRYLJ0F/BYdcjXD/3Z//YKLOeo2JjmzDtj
         O1bQ==
X-Gm-Message-State: APjAAAVSJls8jhAFqgV0w6NRT3SL7Jot+n/nsS4wohnCO3uTxgKSG8Yi
        2dOIr+tZYYYqkmFFN+A+raTSA/CJLjIR9n5yojml1w==
X-Google-Smtp-Source: APXvYqz7k6CPy+IQHrODHc6nnFCPtvXkIF9aMkK4LlE5z8uwq98J+HZFQPuQhZFEPsFDPCIgfem690EfOnrfjI//yH4=
X-Received: by 2002:a05:6000:104f:: with SMTP id c15mr19997152wrx.225.1566125593062;
 Sun, 18 Aug 2019 03:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190818104629.GA27360@amd>
In-Reply-To: <20190818104629.GA27360@amd>
From:   Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date:   Sun, 18 Aug 2019 12:53:01 +0200
Message-ID: <CAOf5uwnUx3mtGGHFGqKB30qcb_AMhMEhHLp2pf-4pUdhi7KP7w@mail.gmail.com>
Subject: Re: wifi on Motorola Droid 4 in 5.3-rc2
To:     Pavel Machek <pavel@ucw.cz>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Sebastian Reichel <sre@kernel.org>, nekit1000@gmail.com,
        mpartap@gmx.net, Merlijn Wajer <merlijn@wizzup.org>,
        "open list:TI WILINK WIRELES..." <linux-wireless@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi

On Sun, Aug 18, 2019 at 12:46 PM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> First, I guess I should mention that this is first time I'm attempting
> to get wifi going on D4.
>
> I'm getting this:
>
> user@devuan:~/g/ofono$ sudo ifconfig wlan0 down
> user@devuan:~/g/ofono$ sudo ifconfig wlan0 up
> user@devuan:~/g/ofono$ sudo iwlist wlan0 scan
> wlan0     Interface doesn't support scanning.
>

Try to use iw command. iwlist use an obsolete interface that you need
to activate in kernel for back compatibility with old command. Can be
your problem?

Michael

> user@devuan:~/g/ofono$ sudo ifconfig wlan0 down
> user@devuan:~/g/ofono$ sudo iwlist wlan0 scan
> wlan0     Interface doesn't support scanning.
>
> user@devuan:~/g/ofono$
>
> I'm getting this warning during bootup:
>
> [   13.733703] asoc-audio-graph-card soundcard: No GPIO consumer pa
> found
> [   14.279724] wlcore: WARNING Detected unconfigured mac address in
> nvs, derive from fuse instead.
> [   14.293273] wlcore: WARNING Your device performance is not
> optimized.
> [   14.304443] wlcore: WARNING Please use the calibrator tool to
> configure your device.
> [   14.317474] wlcore: loaded
> [   16.977325] motmdm serial0-0: motmdm_dlci_send_command: AT+VERSION=
> got MASERATIBP_N_05.25.00R,026.0R,XSAMASR01VRZNA026.0R,???
>
> Any ideas?
>
> Best regards,
>                                                                         Pavel
>
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html



-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
