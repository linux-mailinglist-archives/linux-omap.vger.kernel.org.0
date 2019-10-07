Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4BB7CE999
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 18:45:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728709AbfJGQpN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 12:45:13 -0400
Received: from mail.blih.net ([212.83.177.182]:51390 "EHLO mail.blih.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728031AbfJGQpN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 7 Oct 2019 12:45:13 -0400
X-Greylist: delayed 398 seconds by postgrey-1.27 at vger.kernel.org; Mon, 07 Oct 2019 12:45:12 EDT
Received: from mail.blih.net (mail.blih.net [212.83.177.182])
        by mail.blih.net (OpenSMTPD) with ESMTP id c5fe113e;
        Mon, 7 Oct 2019 18:38:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=bidouilliste.com; h=date
        :from:to:cc:subject:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=mail;
         bh=x8Fb8EJYC8DBijQk39x8YH5AULw=; b=kSCt9zRMRkRXIBi7Jle6eJm45QFm
        0rHpyhYEZ/UGz7DLPG5fqEuAMDu21cHZJNxV8NGayqyJt/YmaXSbVnWdeqWdFr/F
        k/ThBug0HPc9kTUvqEW/fs/WLAW93pbcwpIPExl0jiY6eJqLOf9jETMJy3uC+rF3
        X5d5z/c7GEM3qfo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=bidouilliste.com; h=date
        :from:to:cc:subject:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; q=dns; s=
        mail; b=SsqDpYzYXtI8Tul7fI3I19ADwfqgOwakPKW9p6pkQqIcb24K3RKdmTT1
        Nf8IwNs3tMDR3LC7Em3IISZDQZ+3U3Bm34owITo5s3FwSgYugS41gBZdqC30acWj
        QY+MePjw64aoVjFmfRvqj0XS8020tQwMuQz92b9/emyGIwXS1ns=
Received: from sonic.home.blih.net (ip-9.net-89-3-105.rev.numericable.fr [89.3.105.9])
        by mail.blih.net (OpenSMTPD) with ESMTPSA id 1b727bdc
        TLS version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO;
        Mon, 7 Oct 2019 18:38:31 +0200 (CEST)
Date:   Mon, 7 Oct 2019 18:38:30 +0200
From:   Emmanuel Vadot <manu@bidouilliste.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Emmanuel Vadot <manu@freebsd.org>, bcousson@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: Set status to disable for MMC3
Message-Id: <20191007183830.71e1303d6bd713014dc36710@bidouilliste.com>
In-Reply-To: <20191007161634.GS5610@atomide.com>
References: <20191007080339.57209-1-manu@freebsd.org>
        <20191007161634.GS5610@atomide.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; amd64-portbld-freebsd13.0)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 7 Oct 2019 09:16:34 -0700
Tony Lindgren <tony@atomide.com> wrote:

> Hi,
> 
> * Emmanuel Vadot <manu@freebsd.org> [191007 08:04]:
> > Commit 5b63fb90adb95 ("ARM: dts: Fix incomplete dts data for am3 and am4 mmc")
> > fixed the mmc instances on the l3 interconnect but removed the disabled status.
> > Fix this and let boards properly define it if it have it.
> 
> The dts default is "okay", and should be fine for all the
> internal devices even if not pinned out on the board. This
> way the devices get properly idled during boot, and we
> avoid repeating status = "enabled" over and over again in
> the board specific dts files.

 That is not correct, if a status != "disabled" then pinmuxing will be
configured for this device and if multiple devices share the same pin
then you have a problem. Note that I have (almost) no knowledge on Ti
SoC but I doubt that this is not the case on them.
 Also every other boards that I work with use the standard of setting
every node to disabled in the dtsi and let the board enable them at
will. Is there something different happening in the TI world ?

> Then the board specific dts files might want to configure
> devices with status = "disabled" if really needed. But this
> should be only done for devices that Linux must not use,
> such as crypto acclerators on secure devices if claimed by
> the secure mode.
> 
> So if this fixes something, it's almost certainly a sign
> of something else being broken?

 In this case it's FreeBSD being  because (I think) we have bad support
for the clocks for this module so we panic when we read from it as the
module isn't clocked. And since I find it wrong to have device enabled
while it isn't present I've sent this patch.

 Cheers,

> Regards,
> 
> Tony
> 
> 
> > Fixes: 5b63fb90adb95 ("ARM: dts: Fix incomplete dts data for am3 and am4 mmc")
> > Signed-off-by: Emmanuel Vadot <manu@freebsd.org>
> > ---
> >  arch/arm/boot/dts/am33xx.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
> > index fb6b8aa12cc5..b3a1fd9e39fa 100644
> > --- a/arch/arm/boot/dts/am33xx.dtsi
> > +++ b/arch/arm/boot/dts/am33xx.dtsi
> > @@ -260,6 +260,7 @@
> >  				ti,needs-special-reset;
> >  				interrupts = <29>;
> >  				reg = <0x0 0x1000>;
> > +				status = "disabled";
> >  			};
> >  		};
> >  
> > -- 
> > 2.22.0
> > 


-- 
Emmanuel Vadot <manu@bidouilliste.com>
