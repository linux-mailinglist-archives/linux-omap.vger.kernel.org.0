Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04FE9740F5
	for <lists+linux-omap@lfdr.de>; Wed, 24 Jul 2019 23:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729180AbfGXVlX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Jul 2019 17:41:23 -0400
Received: from vern.gendns.com ([98.142.107.122]:59992 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726843AbfGXVlX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 24 Jul 2019 17:41:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=UuGXRLQsNfnLLeQlECv3qtJu81qwOW7wpiijkhu3MyI=; b=rut6GxhVwJzWTXE8FVY1qvjPC3
        iJbujZTDzrPUAF8Xh6dxoLhdS/mHAhuDZNqd3FYGKw0dLd0pH39aKRq2nHMP3UjfoT7fftu+DTGSN
        ZobLs1aSxNBrO+ETY9Z+vssUEKQV8PPZSDWfxBzyTHEs6eV0j8D8S/NExY4zKgTo/P03yM3NDNVy6
        TRxIId9OJ1J1+1mO2N8j9HAODu+boexmoERJRIolmD5WoVGM0CQlFB1DabM7g2HhQK3CaIowdadq+
        RpTZRTSZWqr0C5xXOAc7Ug4cud8Bp837uIRoGb9v1MqZey5s/bkuH2eXTVEuvnyHxiLzO/7g4h5UB
        RLXp8mzw==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net ([108.198.5.147]:40284 helo=[192.168.0.134])
        by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <david@lechnology.com>)
        id 1hqP0i-00EHvF-Ol; Wed, 24 Jul 2019 17:41:20 -0400
Subject: Re: [PATCH] ARM: dts: am335x-boneblue: Use of
 am335x-osd335x-common.dtsi
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Robert Nelson <robertcnelson@gmail.com>
References: <20190724212616.17945-1-david@lechnology.com>
From:   David Lechner <david@lechnology.com>
Message-ID: <978ea35c-793a-fd7b-ecd3-93534fdf4812@lechnology.com>
Date:   Wed, 24 Jul 2019 16:41:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190724212616.17945-1-david@lechnology.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 7/24/19 4:26 PM, David Lechner wrote:
> This makes use of the am335x-osd335x-common.dtsi file that contains the
> common device tree components for Octavo Systems AM335x System-in-
> Package that is used on the BeagleBone Blue.
> 
> This has two minor side-effects:
> 1. pinmux_i2c0_pins is renamed to pinmux-i2c0-pins
> 2. the 1MHz cpufreq operating point is enabled

Oops. should be 1000MHz

