Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4800026272A
	for <lists+linux-omap@lfdr.de>; Wed,  9 Sep 2020 08:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbgIIGaT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Sep 2020 02:30:19 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:30963 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbgIIGaT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Sep 2020 02:30:19 -0400
X-Greylist: delayed 147097 seconds by postgrey-1.27 at vger.kernel.org; Wed, 09 Sep 2020 02:30:17 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1599633014;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=QxLNng5Qm2uiLw8WQSnN0S+zLfaSuY/I32X69Pq6CT0=;
        b=nCnFGXE/DLX+yYII7CfrHQ3ZJp2W/uv4d5BGqH+uxGqQvPLABbo0GzVIJ1fziP06Vk
        J/oF0x+JCxuBP3Sv6DkPCm26lfMtKFVUg+smKcPpm5jYbeLA9vog/iX9wQvSDLvzmM/l
        xkv1oeMqCfly+tQswoy1I0IijvL77oL24j/AlGBBNMAd54inU8mVlc48em7+92h+W7zE
        vi85D/0YgSHVKM0lw3rjb73rJB0hM86s7K8Mc0mzaIKOr2ymIDiiz3jeoxEKPk0DYPXA
        xNChpjEr2AcfsWPJYFAFGHzQYqVSkxznJWXkPOqnchmQklcs1UHAMupiaYTbG8e/1xCY
        pqWw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAgw4nsUA=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id n03b0dw896TWWj7
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 9 Sep 2020 08:29:32 +0200 (CEST)
Subject: Re: Mailing list about low levels of Linux on cellphones
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200908225610.GA25399@duo.ucw.cz>
Date:   Wed, 9 Sep 2020 08:29:32 +0200
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Sebastian Reichel <sre@kernel.org>, nekit1000@gmail.com,
        mpartap@gmx.net, Merlijn Wajer <merlijn@wizzup.org>,
        martin_rysavy@centrum.cz, "David S. Miller" <davem@davemloft.net>,
        guido.gunther@puri.sm, konradybcio@gmail.com, arnd@arndb.de,
        martin.botka1@gmail.com,
        Tinkerphones Community <community@tinkerphones.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: 7bit
Message-Id: <A9E9E0CF-FCFA-4224-90CC-F3D2B718CFD0@goldelico.com>
References: <20200908225610.GA25399@duo.ucw.cz>
To:     Pavel Machek <pavel@ucw.cz>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Pavel,

> Am 09.09.2020 um 00:56 schrieb Pavel Machek <pavel@ucw.cz>:
> 
> Hi!
> 
> It seems there is quite a lot of efforts porting kernel to various
> cellphones.

Yes, and it is sisyphos work to get it 100% into mainline... Most
projects I know about are at 99,5%.

> 
> Librem 5 and PinePhone have their own hardware, people around Maemo
> Leste work with Nokia N900 and Droid 4, there's group working with
> Sony cellphones, there are postmarketOS people and there are probably
> groups I don't know about.

And there is Openmoko and successors (GTA04, Pyra, GTA15).

> I believe some coordination would be useful, so we end up with
> compatible solutions for various problems.

IMHO the main problem we all share is power management.

> 
> It would be also good to know how ther hardware is progressing. I'd
> really like to have phone I could use as a _phone_, running mainline
> kernel. So far N900 with original Maemo is closest I could get. 
> 
> Would it be possible to create a mailing list on vger.kernel.org?

Hm. My experience with asking for creating an openpvrsgx mailing list
at vger.kernel.org was like asking the sun to shine during night.

In the end we did set up our own mailing list and github project:

https://lists.openphoenux.org/mailman/listinfo.cgi/openpvrsgx-devgroup
https://github.com/openpvrsgx-devgroup/linux_openpvrsgx

What I can offer is to run a similar list. You may remember that
OpenPhoenux was the continuation of the OpenMoko community mailing lists
having the same focus as you describe above.

> Probably phones@ or phone-devel@? I believe it would be useful to
> cover hardware-dependend pieces of the phone stack (ofono,
> modemmanager) as well as kernel.

I am fine with either.

BR,
Nikolaus

