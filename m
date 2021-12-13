Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43F99472A83
	for <lists+linux-omap@lfdr.de>; Mon, 13 Dec 2021 11:44:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235443AbhLMKoV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 Dec 2021 05:44:21 -0500
Received: from mail.wizzup.org ([95.217.97.174]:44114 "EHLO wizzup.org"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235394AbhLMKoV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 13 Dec 2021 05:44:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
        s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
        Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=q4lqbwLHCjh76ypd2M1fQTayDlJY+WmhE8nyE0ZoRwA=; b=VwGGTYMk63qbxRKfiwxApGvN+X
        OzUPqjhgWNc2PQy/xAZHQa6DoDvG//nO3nsvV5/Npn6fFQPScjSQgXTk7YDrCkqqR2p1dNm7bKja9
        6BA+yGAfYJZW02ZrXLQZxXnJL05BXLHc/XuqHbkZx7rvCCBDsJeueJSp+fN0o7Q+7SXROVNWfxJxp
        V2jMm0I9mNrhCTDc0kRe7foaum+6MPIiqL62lsgOpMXMu82u8Ih60SnPijSFha1NUovaRl2lMxr3R
        JMu47nHwlEKi8bNA1pkPlUEWR8cAn7aI6N7BXhxSHDx2o6DriAJpDWOdJGqZZObvGvGTZ371EG8b2
        0k7OuP+g==;
Received: from [45.83.235.159] (helo=[0.0.0.0])
        by wizzup.org with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <merlijn@wizzup.org>)
        id 1mwioY-0001yT-J1; Mon, 13 Dec 2021 10:44:14 +0000
Subject: Re: Oops while booting 5.15.2 on Nokia N900
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
References: <6fa3d07a-28e5-7853-e6ca-fc405d3080e4@archive.org>
 <c75ac850-7d9b-6263-a046-57c8f4435090@archive.org>
 <f463d8f2-109e-3040-4350-ce20d651ffe6@archive.org>
 <20211208205700.GA12125@duo.ucw.cz> <20211208220400.1f9cff00@aktux>
 <ee94556b-2c35-c641-a86a-e9e70600aab7@archive.org>
 <20211210111345.GD799423@darkstar.musicnaut.iki.fi>
 <7438fa4a-ea92-a3ce-4cc7-8da8a4af02b5@wizzup.org>
 <YbRL75F/SlcPJjtf@atomide.com>
 <370c8e25-d582-decb-5dd9-625d6548dcd3@wizzup.org>
 <Ybbegfbnl8+5Xqc5@atomide.com>
 <9dc4e8d4-ca35-c931-d4c7-7bae43184ef1@wizzup.org>
From:   Merlijn Wajer <merlijn@wizzup.org>
Message-ID: <7b61f212-b665-f8fb-72c7-4c354e773f5a@wizzup.org>
Date:   Mon, 13 Dec 2021 11:50:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <9dc4e8d4-ca35-c931-d4c7-7bae43184ef1@wizzup.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 13/12/2021 11:36, Merlijn Wajer wrote:

>>
>> OK so it's not omap_hsmmc vs sdhci-omap issue. So does setting the thermal
>> driver to status = "disabled" make the issue disappear?
> 
> In my kernel I have CONFIG_OMAP3_THERMAL disabled currently (per my
> other email), but my understanding is that you're suggesting that
> disabling the node all together in the dts can help. Would this be the
> bandgap node, thermal_sensors or cpu_thermal node(s)?

I made this change (I just disabled all three of them, not knowing which
one was the right one, will try to narrow that down further if useful):

> diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
> index 1746a44e96bc..e97b7efbd790 100644
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
> +
> +&thermal_zones {
> +       status = "disabled";
> +};
> +

and I am no longer seeing the oopses or resets when running "sleep 30;
blkid" from minimal userspace.

Thanks,
Regards,
Merlijn
