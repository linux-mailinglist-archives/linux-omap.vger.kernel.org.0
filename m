Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6266156891
	for <lists+linux-omap@lfdr.de>; Sun,  9 Feb 2020 04:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727586AbgBIDsv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 8 Feb 2020 22:48:51 -0500
Received: from mail-wr1-f44.google.com ([209.85.221.44]:36139 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727550AbgBIDsv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 8 Feb 2020 22:48:51 -0500
Received: by mail-wr1-f44.google.com with SMTP id z3so3459732wru.3
        for <linux-omap@vger.kernel.org>; Sat, 08 Feb 2020 19:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:subject:references:date:mime-version
         :content-transfer-encoding:from:message-id:in-reply-to:user-agent;
        bh=4YrwzR5X8lMxMZll45TsKsgILcx/60nsbiebkX+AHOM=;
        b=Pf9nzE+D6xN9OK5DbQdwdz7Q3IfM+/po7Ek8WkzRdcHJ3idvyFOnx6BKLDWo0WnFAI
         WzLZBANG72YW4OwiLvcPcXYi8DWRmWpUOCWHfMu9acxm0cpnWuxT8VBVaTOKZRaGyavQ
         lp6hQpWVRUy9dlDxPYFzz4w5BB1PBi6sndmQEedz48YOnKtTb1aQfgzREezRy9DuGiLG
         6Ucv1yaBdoOip2bTzYk7N2+ehJjqlAyXJnKy35cJUXhZVMsnsFwfPc3NByDxUVmGuE1a
         QYAeYCn4HQH1iefvbMe3GKPmF17OqsK6yKBj3840cXMTQhUMxBJSSZfybEjaFxYJcbrN
         Ufbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:subject:references:date:mime-version
         :content-transfer-encoding:from:message-id:in-reply-to:user-agent;
        bh=4YrwzR5X8lMxMZll45TsKsgILcx/60nsbiebkX+AHOM=;
        b=gC0ToFPEr/5VD/5POvvNtxXfU3C4IzxFyVGBYZEqjWTmPOwBZCbrQlFdwj8uYje7xj
         4UX0NFNDPqGuKhC8Athx+mFCuWPWPVzS547laKGcmWwRKo9EZ+yF6VZBVTeML8uFa5QN
         C3vcahaoW5473o3Cy867aD4d4nWBSf/YtasuZ4o74y8/WIDOsgQkBJvntBPBzqgSp0/3
         QhIyDFBQVmUbThZ18qxVqSm2ma84d7v963JLeLFVUpQaK+s+Ae017XNNPqIpDU7HpiOF
         uRDb4rVF3Oh8eZGjCiOOAHIOf4dege4HYEkrd/R0wxEq2vO+qi2HzzpEbOydCLJV6DLQ
         BR0g==
X-Gm-Message-State: APjAAAVGvidshtPoA9WCqr4A/nle3M3XA5L5EjdazOUCZ11PVKp6IdlQ
        mWc7SZGqhWGbZ7dvBZPQ1kg=
X-Google-Smtp-Source: APXvYqwIRGVIwGLqcxtEUvOqVRb00RrSwidl38bQh5oX7YPLGFZjAMjYfx5QepLl4LYwawW/UUOJ1A==
X-Received: by 2002:a05:6000:1112:: with SMTP id z18mr8193495wrw.140.1581220129578;
        Sat, 08 Feb 2020 19:48:49 -0800 (PST)
Received: from supervisor.net28 ([46.53.250.234])
        by smtp.gmail.com with ESMTPSA id c4sm9493525wml.7.2020.02.08.19.48.48
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 08 Feb 2020 19:48:48 -0800 (PST)
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
To:     "Pavel Machek" <pavel@ucw.cz>, "Merlijn Wajer" <merlijn@wizzup.org>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        "Tony Lindgren" <tony@atomide.com>,
        "Ivaylo Dimitrov" <ivo.g.dimitrov.75@gmail.com>
Subject: Re: N900: Remove mmc1 "safety feature"? (was: Re: mmc0 on Nokia N900
 on Linux 5.4.18)
References: <5362c659-120f-5247-aaa5-7916229300bc@wizzup.org>
 <20200208190448.GA12984@amd> <270f27c9-afd6-171d-7dce-fe1d71dd8f9a@wizzup.org>
 <1eac0db3-17ce-8ebd-4997-8b1c282126e4@wizzup.org> <20200208220621.GA18161@amd>
 <d2d6d6ac-c964-ac48-1616-6f1826219385@wizzup.org>
Date:   Sun, 09 Feb 2020 06:48:47 +0300
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From:   "Arthur D." <spinal.by@gmail.com>
Message-ID: <op.0fpbjlbwhxa7s4@supervisor.net28>
In-Reply-To: <d2d6d6ac-c964-ac48-1616-6f1826219385@wizzup.org>
User-Agent: Opera Mail/12.16 (Linux)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I suppose the real life scenario would be:

0. The OS runs on eMMC.
1. The user opens his phone back cover and inserts MicroSD card.
2. Kernel doesn't try to access the card until the cover is closed.

It seems wise to me: we don't want to damage user's data or hardware.
Accessing data on unstable medium can't be considered safe.
While the cover is open and user just inserted the microsd card everything
can happen - the phone can be dropped, may be unstable contact to microsd
while the user interacting it, etc.

It seems to be inconvenient for us, while we run OS mostly from microsd.
But removing such behaviour from the kernel completely doesn't seem to
be a good idea generally. Vanilla kernel shouldn't be dedicated for
debugging purposes or edge cases (like running only from external MMC).
Running from embedded MMC should be common for most users in perspective.

If I remember correctly, if the microsd is already mounted and the back
cover is open, nothing bad happens. It continues to work. You can unmount
the card and remove it safely. But you are not going to see the new card
insertion detected until you close the cover.

I'm not sure about the last paragraph. Please correct me if I'm wrong about
how it actually works.


>> It is very bad for debugging, agreed.
>>
>> It makes sense for regular usage: when user removes back cover, system
>> unmounts the u-SD card, so that it is ready for user to remove
>> it. Note that we do _not_ have "remove the card safely" button in the
>> UI; back cover serves that purpose.
>>
>> That said... for Leste just keep the patch. And maybe apply that one
>> to shutdown system when battery is low :-).
>
> So how does this currently happen, the unmounting? Does the mmc1 card
> just disappear from /dev/ without any safe unmount? I don't understand
> how the current setup can work from a userspace point of view.
>
> Userspace could react on kernel events that tell it the cover is open,
> but I assume the kernel doesn't just decide to nuke the node from /dev/,
> so in that case the current DTS setup still doesn't make sense, right?
>
> What am I missing? Could you describe how this would work in a 'real
> life' scenario?
