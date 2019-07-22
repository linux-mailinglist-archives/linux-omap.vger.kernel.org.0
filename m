Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32D176FB29
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jul 2019 10:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbfGVIVY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 22 Jul 2019 04:21:24 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:54590 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726944AbfGVIVY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 22 Jul 2019 04:21:24 -0400
X-Greylist: delayed 915 seconds by postgrey-1.27 at vger.kernel.org; Mon, 22 Jul 2019 04:21:23 EDT
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1563782766; x=1566374766;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:Mime-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Ss020kHm3zmso5F8zIoSk4X3Nb0AGLoB67uKPMz/dNc=;
        b=KKStXPWx8VbcB5yj+EeD+87ofoxB4pF1i6doZ/OSVff7Il6GTApsn29mLV0EXdBr
        lMyGHIc1ZRTqLjqT+lFQKgd4snnC7p20kr4kVsZW4HDwQHgWQK/UGYQyiuTRku/x
        6BDpBxLPippW/zKiP5g/eU7TiLIsfHFOr/KluAVQiQw=;
X-AuditID: c39127d2-193ff70000001aee-c9-5d356e6ec6dd
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 85.1E.06894.E6E653D5; Mon, 22 Jul 2019 10:06:06 +0200 (CEST)
Received: from llp-tremmet.phytec.de ([172.16.22.38])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2019072210060565-391138 ;
          Mon, 22 Jul 2019 10:06:05 +0200 
Message-ID: <812cb14400ee43176c2118247c8c47230b9206c2.camel@phytec.de>
Subject: Re: [PATCH] ARM: dts: am335x-wega.dtsi: fix wrong card detect pin
 level
From:   Teresa Remmet <t.remmet@phytec.de>
To:     Andreas Klinger <ak@it-klinger.de>, linux-omap@vger.kernel.org
Cc:     bcousson@baylibre.com, tony@atomide.com, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Mon, 22 Jul 2019 10:06:05 +0200
In-Reply-To: <20190709183209.y64keopah5rkismc@arbad>
References: <20190709183209.y64keopah5rkismc@arbad>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 22.07.2019 10:06:05,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 22.07.2019 10:06:05,
        Serialize complete at 22.07.2019 10:06:05
X-TNEFEvaluated: 1
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="UTF-8"
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDLMWRmVeSWpSXmKPExsWyRoCBSzcvzzTWYO1uXovGaVvYLe7M/8tq
        Mf/IOVaLy7vmsFnMXtLPYrH0+kUmi9a9R9gt9l/xcuDwWDNvDaPHt6+TWDze32hl95jw7Ra7
        x6ZVnWwenzfJBbBFcdmkpOZklqUW6dslcGX0nhcpWMBRcWT7T+YGxjNsXYwcHBICJhLvdzB3
        MXJxCAnsYJR48fcTG4RzkVHizK4tLF2MnBy8Am4Sz3p3g9nCAkES0z41soPYbAIaEk9XnGYC
        sUUEnCQO3pzECNLMLNDPKLFr9jOwBhYBVYmp92+xgmzjBNp2pDsZxBQSMJZ4fr8cpEJCQEfi
        7ak+FpAwr4CgxN8dwiBTJAQamSQOfu5jhagRkji9+CwziM0sIC+x/e0cKFtTonX7b/YJjIKz
        ENpnIamahaRqASPzKkah3Mzk7NSizGy9gozKktRkvZTUTYzAGDg8Uf3SDsa+OR6HGJk4GA8x
        SnAwK4nw5hmYxgrxpiRWVqUW5ccXleakFh9ilOZgURLn3cBbEiYkkJ5YkpqdmlqQWgSTZeLg
        lGpg7HmtzXalwOy74jtT/SnRlYuus1lpblDtuxIUnf387ZuzxeJ6rut7SiuCZBmknUMr55jf
        +dGy70vpUfMfCoFf81T4LQxdi49ZFOwPt/DKsDb0kLw951IW3+HfbKqc+VuWfzuZxbxh3bRF
        /GIdNyKWcWnVCC6Nf3Hx6vXYVsO7fat5pTSrlauVWIozEg21mIuKEwGjwjijbwIAAA==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello Andreas,

Am Dienstag, den 09.07.2019, 20:32 +0200 schrieb Andreas Klinger:
> mmc cards on mmc1 are not detected because of wrong card detect (cd)
> level.
> 
> Change cd from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW.
> 
> This is necessary because of commit e63201f19438 ("mmc: omap_hsmmc:
> Delete platform data GPIO CD and WP")

Thanks for noticing. But the fix is already in master.

Teresa

> 
> Signed-off-by: Andreas Klinger <ak@it-klinger.de>
> ---
>  arch/arm/boot/dts/am335x-wega.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/am335x-wega.dtsi
> b/arch/arm/boot/dts/am335x-wega.dtsi
> index b7d28a20341f..84581fed3d06 100644
> --- a/arch/arm/boot/dts/am335x-wega.dtsi
> +++ b/arch/arm/boot/dts/am335x-wega.dtsi
> @@ -157,7 +157,7 @@
>  	bus-width = <4>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&mmc1_pins>;
> -	cd-gpios = <&gpio0 6 GPIO_ACTIVE_HIGH>;
> +	cd-gpios = <&gpio0 6 GPIO_ACTIVE_LOW>;
>  	status = "okay";
>  };
>  
> -- 
> 2.11.0
> 
> 

