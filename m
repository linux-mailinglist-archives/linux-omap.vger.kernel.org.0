Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CDB3477055
	for <lists+linux-omap@lfdr.de>; Thu, 16 Dec 2021 12:33:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233763AbhLPLdY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Dec 2021 06:33:24 -0500
Received: from mail.wizzup.org ([95.217.97.174]:44488 "EHLO wizzup.org"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231231AbhLPLdX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 16 Dec 2021 06:33:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
        s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
        Date:Message-ID:Subject:From:References:Cc:To:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=hqGo2loNQQ8plhh0qQp1peLAAf0XIz8ujjtxNZ2LQAM=; b=iCUEe6Y+L8QBRJH0fEaM1fqwyS
        eyaCClczGd1Y4A6SmQvquBvtlW4LdX6SG2ZAL6uIebLHqkZjGsvaeFQYdoNih0SxF5kz6NwPj08Dc
        tj7GqS7ocZoxP7AHyCUqWg5WCccpE+LivHoRPpR3IcaQw75dzmiS8j/hLG2SmdOhxBOjq6gUR9dG+
        5SjWkTMhYzBn81VRCbWVHh2R0tXlenc90RyyuMwFqd6vA+fjKaJ7IMRQ+yKw9/zfoWIdn+XhnPCts
        NCf3sy/M2mhsH0CcZrODeAP3Uw8NeWEsBN7e9PkH7dNxRb2KabztqHCwXq8OPKGK8RzoOAbwHXBMK
        AJzmQjlA==;
Received: from [45.83.235.159] (helo=[0.0.0.0])
        by wizzup.org with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <merlijn@wizzup.org>)
        id 1mxp0S-0004Mi-Js; Thu, 16 Dec 2021 11:33:04 +0000
To:     Tony Lindgren <tony@atomide.com>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        "Merlijn B.W. Wajer" <merlijn@archive.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Pavel Machek <pavel@ucw.cz>,
        linux-omap <linux-omap@vger.kernel.org>,
        Dev Null <devnull@uvos.xyz>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
References: <20211208205700.GA12125@duo.ucw.cz>
 <20211208220400.1f9cff00@aktux>
 <ee94556b-2c35-c641-a86a-e9e70600aab7@archive.org>
 <20211210111345.GD799423@darkstar.musicnaut.iki.fi>
 <7438fa4a-ea92-a3ce-4cc7-8da8a4af02b5@wizzup.org>
 <YbRL75F/SlcPJjtf@atomide.com>
 <370c8e25-d582-decb-5dd9-625d6548dcd3@wizzup.org>
 <Ybbegfbnl8+5Xqc5@atomide.com>
 <9dc4e8d4-ca35-c931-d4c7-7bae43184ef1@wizzup.org>
 <7b61f212-b665-f8fb-72c7-4c354e773f5a@wizzup.org>
 <YbdPn21Xf8HD6ILM@atomide.com>
From:   Merlijn Wajer <merlijn@wizzup.org>
Subject: Re: Oops while booting 5.15.2 on Nokia N900
Message-ID: <aaf5d01a-4e31-67cc-7312-4449a30a0de8@wizzup.org>
Date:   Thu, 16 Dec 2021 12:38:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YbdPn21Xf8HD6ILM@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 13/12/2021 14:50, Tony Lindgren wrote:
> * Merlijn Wajer <merlijn@wizzup.org> [211213 10:45]:
>
>> and I am no longer seeing the oopses or resets when running "sleep 30;
>> blkid" from minimal userspace.
> 
> If disabling the cpu_thermal makes things behave, chances are we have wrong
> thermal values in the dts for n900 and possible all 34xx devices. The 36xx
> values are behaving AFAIK.

Just disabling the bandgap doesn't seem to be enough. I also tried
disabling just the bandgap and thermal_zones, but that is also isn't
enough. However, *just* disabling cpu_thermal also isn't enough.

Disabling both cpu_thermal and bandgap is enough to stop the oopses [1].
So it sounds like there might potentially be some problems in
cpu_thermal as well then?

Regards,
Merlijn

[1]

> diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
> index 1746a44e96bc..7aedd21282e1 100644
> --- a/arch/arm/boot/dts/omap3-n900.dts
> +++ b/arch/arm/boot/dts/omap3-n900.dts
> @@ -28,6 +28,19 @@ &aes2_target {
>         status = "disabled";
>  };
> 
> +&cpu_thermal {
> +       status = "disabled";
> +};
> +
> +&bandgap {
> +       status = "disabled";
> +};
> +//
> +//&thermal_zones {
> +//     status = "disabled";
> +//};
> +
> +
>  / {
>         model = "Nokia N900";
>         compatible = "nokia,omap3-n900", "ti,omap3430", "ti,omap3";
