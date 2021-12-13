Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55174472A22
	for <lists+linux-omap@lfdr.de>; Mon, 13 Dec 2021 11:33:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238496AbhLMKc6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 Dec 2021 05:32:58 -0500
Received: from mail.wizzup.org ([95.217.97.174]:44080 "EHLO wizzup.org"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239237AbhLMKaj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 13 Dec 2021 05:30:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
        s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
        Date:Message-ID:Subject:From:References:Cc:To:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=2dU+gk3bZjB6vUvpoS3LNq7PHvfW4rKYW93QAelOHu0=; b=qRpDPn/lP79601acXoJ7Ywtuqp
        Op43AfrgucHyNgmhh7FgDnVNf8wu2n+CjuRq9HCalIZ+gPPWKlmUc9wIauV/UR1wvgHD/Yb02kNvW
        brCcFo7UzLKkNLQVDxguAOUQ0mxcfzEDRiLZIVI2GDU8LKt1EdZ+0OT1xDWAqGhqZaZyjf3NgznXg
        CUuswCDBNjDKUECeLIN0Kl4XPOn/8nIb0vpTMb2dxSYF576+SfqkKlDrXMyRdGlZxMuTYbCkopQ7M
        XSvnsAtMHaxAr4Q9ntSBOk05IyO023xFDVYEZ0vxxjbJ5mfXM3QKmhoXzDu4gotifHG5HNxSzWtjC
        95VorG/A==;
Received: from [45.83.235.159] (helo=[0.0.0.0])
        by wizzup.org with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <merlijn@wizzup.org>)
        id 1mwib3-0001xA-5E; Mon, 13 Dec 2021 10:30:17 +0000
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
From:   Merlijn Wajer <merlijn@wizzup.org>
Subject: Re: Oops while booting 5.15.2 on Nokia N900
Message-ID: <9dc4e8d4-ca35-c931-d4c7-7bae43184ef1@wizzup.org>
Date:   Mon, 13 Dec 2021 11:36:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <Ybbegfbnl8+5Xqc5@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 13/12/2021 06:47, Tony Lindgren wrote:
> * Merlijn Wajer <merlijn@wizzup.org> [211211 11:07]:
>> On 11/12/2021 07:57, Tony Lindgren wrote:
>>> Just to see if this relates to the omap_hsmmc.c driver, maybe try this with
>>> v5.16-rc1 also with a patch that changes omap3.dtsi ti,omap3-hsmmc compatibles
>>> with ti,omap3-sdhci compatibles.
>>
>> I tried this just now on v5.16-rc4 with the following change [1] (and a
>> few reverts for off mode) and I don't think it helped get rid of the
>> error, I see the following. [2] Maybe it does help narrow the specific
>> error down if it happens with both hsmmc and sdhci?
> 
> OK so it's not omap_hsmmc vs sdhci-omap issue. So does setting the thermal
> driver to status = "disabled" make the issue disappear?

In my kernel I have CONFIG_OMAP3_THERMAL disabled currently (per my
other email), but my understanding is that you're suggesting that
disabling the node all together in the dts can help. Would this be the
bandgap node, thermal_sensors or cpu_thermal node(s)?

Thanks,
Regards,
Merlijn
