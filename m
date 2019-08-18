Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F388916A5
	for <lists+linux-omap@lfdr.de>; Sun, 18 Aug 2019 14:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbfHRMpQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 18 Aug 2019 08:45:16 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37936 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726247AbfHRMpQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 18 Aug 2019 08:45:16 -0400
Received: by mail-wr1-f67.google.com with SMTP id g17so5907628wrr.5
        for <linux-omap@vger.kernel.org>; Sun, 18 Aug 2019 05:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R2axUqO7BW/8JGo+TtC7MH/Mt1ZFiLk2XRc0w1LrBFA=;
        b=mGdfTPmmiXtRRsVK5clC/hcrfnL+/X7oI8OfBgNhBOk3gIaCEau8gEB9S3/eAg9Eg5
         rt0TGuF4v5QGCXz3gPFs6yW5RwTn1ee32h/Mlved/1Uos2LxvDmwN52uJW+jdpZ4EAex
         yjENM1Tt29kRC6UE1t8jl7zbSjMuLvR1kIxg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R2axUqO7BW/8JGo+TtC7MH/Mt1ZFiLk2XRc0w1LrBFA=;
        b=MtXW0owfMdc+fQKSaZqLkDpfFSZYmqYjnGVxG9/msVoqHs5xgABe1QjYLEwtiwGvkB
         68/dm5uJ46Vw0kn+rn/PmL1un4OPT/KgkyF5RwvXAQfmrxX0U8SK1lVLCCvTV2rmFqOU
         AEwaw52P46Aqv+Zk3DvhuSX2OB2cf9/hqCt0t1rmW9Ccs3QRCpLpl1tTxIOdjna2ewHt
         FSfN7pF3VuyTMDuYyxmcmQdQ2A+7CZKiek4svK+46IMt7ZKXL3zf1DtHfl8hfW9HKQpy
         fSs2omNbkdEUgE9qsOcQNIakdg+XrjtONPcBCmIYADzl5TwQ3AdX8MXCXxsJy9E3Lu7S
         sq1Q==
X-Gm-Message-State: APjAAAXbUUi+vNZ2dSKHDz7sbeKoc2AaimF5ARdCtYnPnsb6jWdY2b39
        ha5oAyMMLvJTDxSLjEvWxpMXfeur7yXBEHvzM4fLCw==
X-Google-Smtp-Source: APXvYqwPdJ5cn3hOeRS8SiLPSklEPlywvHiHvnoysw18xv8yvEqS8q2aUJepTQJ6Lrc+rN5hEFFrJNcoq488n8vaojI=
X-Received: by 2002:adf:facc:: with SMTP id a12mr19969296wrs.205.1566132314527;
 Sun, 18 Aug 2019 05:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190818104629.GA27360@amd>
In-Reply-To: <20190818104629.GA27360@amd>
From:   Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date:   Sun, 18 Aug 2019 14:45:03 +0200
Message-ID: <CAOf5uwmprKDNd-6C0xigdV5ZdkGOquwoXcMVbteK9XNE+sKqSA@mail.gmail.com>
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

Hi Pavel

For the second part

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

This is ok. It means that your nvs file is not the original one taken
from android

> [   14.293273] wlcore: WARNING Your device performance is not
> optimized.

you can use plt command with calibrate

Michael

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
