Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2733541E894
	for <lists+linux-omap@lfdr.de>; Fri,  1 Oct 2021 09:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352605AbhJAHzy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Oct 2021 03:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231237AbhJAHzy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 Oct 2021 03:55:54 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AECFC061775;
        Fri,  1 Oct 2021 00:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=SxUmounGinMNilTQt+DXMiiGyxdV7HSpUjMfEeksWVI=; b=BrJ+V/30bw5YPYDUuRst5faD81
        Z9vpBQdjZh6raD5DuJPsZmBoHtEbuT1pPSlRYCfGdJJBDy4mKr59m4cIGNRgWaKhWP6opmTE7y/X5
        vcBzllSw4KlgyE+qpjdUfKQ5r9qCC++RXnGpkRNx3+5p1LNOAl7JRvZ62qw7kJcAYW5M=;
Received: from p200300ccff0b42001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0b:4200:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1mWDMq-0001XY-RY; Fri, 01 Oct 2021 09:54:05 +0200
Date:   Fri, 1 Oct 2021 09:54:04 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-omap@vger.kernel.org, hns@goldelico.com,
        aford@beaconembedded.com,
        =?UTF-8?B?QmVub8OudA==?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] ARM: dts: omap36xx: Remove turbo mode for 1GHz
 variants
Message-ID: <20211001095404.41f73d88@aktux>
In-Reply-To: <20210109170103.1249838-1-aford173@gmail.com>
References: <20210109170103.1249838-1-aford173@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat,  9 Jan 2021 11:01:03 -0600
Adam Ford <aford173@gmail.com> wrote:

> Previously, the 1GHz variants were marked as a turbo,
> because that variant has reduced thermal operating range.
> 
> Now that the thermal throttling is in place, it should be
> safe to remove the turbo-mode from the 1GHz variants, because
> the CPU will automatically slow if the thermal limit is reached.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
> V2:  The orignal patch had the wrong file added. Add the omap36xx.dtsi
> 
hmm, I somehow expected that there is a revert of this thing going
through. But now, the turbo-mode is still missing and I understood the
revert is only in Nikolaus' trees. The 1Ghz mode was working for some
time but does not anymore. Is it just me or do others also have the
same problems?

Regards,
Andreas

> diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
> index 05fe5ed127b0..20844dbc002e 100644
> --- a/arch/arm/boot/dts/omap36xx.dtsi
> +++ b/arch/arm/boot/dts/omap36xx.dtsi
> @@ -72,7 +72,6 @@ opp1g-1000000000 {
>  					 <1375000 1375000 1375000>;
>  			/* only on am/dm37x with speed-binned bit set */
>  			opp-supported-hw = <0xffffffff 2>;
> -			turbo-mode;
>  		};
>  	};
>  

