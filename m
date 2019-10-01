Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72A01C3465
	for <lists+linux-omap@lfdr.de>; Tue,  1 Oct 2019 14:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731685AbfJAMhu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Oct 2019 08:37:50 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:46046 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbfJAMhu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Oct 2019 08:37:50 -0400
Received: by mail-io1-f68.google.com with SMTP id c25so47365091iot.12;
        Tue, 01 Oct 2019 05:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FhGjmsDKKPD3QinXgHs/uFmvxQ7KlC4IGlI0yWXxnE0=;
        b=SFJhuHSvvW8Erq96m6ImL3eOj9JoDGgxYXzBmaiAeyLFuGPT/wzkJf1l7w5eQ+jZHs
         pHpSDRUEYeKgubAl6P98cKWJIUh4hgv8fL/P3cU0fVvj8EIMqvSVfmDrOg4lj7cz6E5u
         dj5JAk9Aordu1jw3j09N0Zwwd0+qF5LPwXnOtkuolUx2dcstilmeBCk0C9huvDWh0xDx
         n68JOqjX3hVXcABMXPV71RCw8nnZjeIjHNbXw3PClR2TFED+9Xc6iZZCYguJHFPKKD+M
         SlcSv2SQuJHQbYlKeYpvzX+YWhpUoMQ06i35N9jZ1vH534UVPFd/N6JPO2dDh9WznuHA
         1D7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FhGjmsDKKPD3QinXgHs/uFmvxQ7KlC4IGlI0yWXxnE0=;
        b=Ghy6G1a9Vai2MrczuSndvKjBjLzTDtAztuwWPv8cTvgI1HFzHSj4x8uHd/ym1Q420p
         HcsvIoTE2ui4A+XPitQPPo2BzM7rZR+5eeRr7U3dVk5t6LNMhmj5uS0e7gl61lgf/yey
         oKiZgqGf0M/uzKmAazuSkAsZ+/ZCLDYtIG8VxeUHUgMbuIa+FWq0W8RRNpkoIE3pyWEQ
         zo/cusNtmkfFiqoumPz0dx5vIKF1KCCGXQhzHryFeCAybJik9psDu5qoWW2KxVPO+k0Z
         aldY3WLMBFZ3tGVlNOdgdzLM1BVNRAN1CqE4232J38UWempe5C4L5SCWqQiJHrRofRJg
         Q4Hg==
X-Gm-Message-State: APjAAAVEs8wLRa78bfdpbRcO0lo2aSP1hmRDCrL9Z88aVxoMW+XadENy
        CiKaOZy/F4KxhCVt+kYLaLlMyOebinT5ErL+iwg=
X-Google-Smtp-Source: APXvYqz7VBVXBG+ZMWE3fVk0pO5Y0YXERVtxa+N9juNb16CLwwIaQ6lC3GHyv2uy+2PbeZn7ajoc+Kexz4K/mtji6X8=
X-Received: by 2002:a92:d84d:: with SMTP id h13mr26003328ilq.205.1569933468111;
 Tue, 01 Oct 2019 05:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xLOCC00UC4PB3vHa6Q7yyhXVEaWgx2X9D9L2dDubd_5fA@mail.gmail.com>
 <9525ffc4-3e1f-9941-8f7b-ba74690add77@emlix.com>
In-Reply-To: <9525ffc4-3e1f-9941-8f7b-ba74690add77@emlix.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 1 Oct 2019 07:37:37 -0500
Message-ID: <CAHCN7xJ7GsnwT3CM7giK1ydGY_9SFNMbhz6U0k2eYvpz_EK9oQ@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_ll: set operational frequency earlier
To:     Philipp Puschmann <philipp.puschmann@emlix.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Oct 1, 2019 at 2:04 AM Philipp Puschmann
<philipp.puschmann@emlix.com> wrote:
>
> A few times i have seen this here too. The wl1837mod should definitely be able to set
> the operaional frequency before loading the firmware.
> It takes nearly 5 seconds to upload the firmware with 115kbps while only
> 0.2s with 3mbps. So i see a high interest to do it the fast way.
> A problem i have identified may be the power supply. At least on my custom board
> the power supply is controlled via gpio. But the serial bluetooth device has no
> support for a regulator. As it is controlled by wifi driver only. I have prepared a patch
> adding regulator support to hci_ll driver. In a few weeks i may try to get it upstream.

Any change you can share with me what you have?  With 5.4 being the
next LTS and at least two of us with broken boards, I am concerned
that a patch in a few weeks may not make the cut for the final release
of 5.4.

>
> Another problem may be the timings. The timings the driver uses are according the wl1837mod
> datasheets but it may that not all devices of that class or the wiring have the same
> specifications and this causes the trouble.
>
> For the above mentioned performance gain i would like to see the problem really solved.

I agree it would be nice to have it working fast, but for others of
us, we just need to work, so unless there is a clear solution to the
problem, I would advocate reverting the patch until the solution can
be found that doesn't break other boards.

> It may be enough to add some sleep time or small delay or something of that kind in
> ll_setup().
>

I am willing to try something if you want.


adam
> Regards,
> Philipp
>
>
> Am 30.09.19 um 22:10 schrieb Adam Ford:
> > Is anyone else having issues with the hci_ll after  a2e02f38eff8
> > ("Bluetooth: hci_ll: set operational frequency earlier") was applied?
> >
> > I have an i.MX6Q with a WL1837MOD attached to UART2.  After this patch
> > I git a bunch of timeouts when initializing the device using the 5.3
> > and 5.3.1 kernel.   I know a bunch of omap and imx users have done
> > some various tests over the years, so I thought I'd ask.
> >
> > [  195.911836] Bluetooth: hci0: command 0xff36 tx timeout
> > [  206.071837] Bluetooth: hci0: command 0x1001 tx timeout
> > [  214.231862] Bluetooth: hci0: Reading TI version information failed (-110)
> > [  214.238712] Bluetooth: hci0: download firmware failed, retrying...
> > [  216.391834] Bluetooth: hci0: command 0xff36 tx timeout
> > [  226.551843] Bluetooth: hci0: command 0x1001 tx timeout
> > [  234.711856] Bluetooth: hci0: Reading TI version information failed (-110)
> > [  234.718705] Bluetooth: hci0: download firmware failed, retrying...
> > [  236.871832] Bluetooth: hci0: command 0xff36 tx timeout
> > [  247.031837] Bluetooth: hci0: command 0x1001 tx timeout
> > [  255.191852] Bluetooth: hci0: Reading TI version information failed (-110)
> > [  255.198706] Bluetooth: hci0: download firmware failed, retrying...
> > Can't init device hci0: Connection timed out (110)
> >
> > Revering this patch fixes the issue, and subsequent patch proposals
> > form Philipp haven't seemed to fix the issues for me on 5.3
> >
> > adam
> >
