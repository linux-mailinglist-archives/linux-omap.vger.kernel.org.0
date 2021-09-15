Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3273C40C202
	for <lists+linux-omap@lfdr.de>; Wed, 15 Sep 2021 10:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232676AbhIOItD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Sep 2021 04:49:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:41640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231610AbhIOItC (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 15 Sep 2021 04:49:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2774661214;
        Wed, 15 Sep 2021 08:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631695664;
        bh=37HeyMHel+k/wlDZvQA9JOKb2529T3W+e5XKkmXDX1I=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=dGqbUPjOCF/tGXC2a/x4Tmy4N6McGkTrftspLLYg5pcCCUzTSFDB9wHiNBQyLikxp
         zJ4qheoU0Z9msh+F9O+XpzXHA5XGdlhn0g1F/mBmUgBmTY6SfVeA3BJtcArYUAZLTI
         H5z0OyDRGJAk5OyKdzGQvgfZnMiQreMM/32mYa/A5km2VPeOUiiCucgKDIpFC4EWlC
         mhJJITNokSVVdr2R6yiFBvRSY6m/4cbuWHuNITw/7BGk/oljPga6OYqmPlQk42gejD
         gnkPlfYkU14qGvj08Jr45FSn69n4XRjprS4tTPqEGQ0eBOoRhqRMdQQ+duTec1x6xU
         2N4NEv4hOlVLw==
Subject: Re: [PATCH v4 8/8] memory: gpmc-omap: "gpmc,device-width" DT property
 is optional
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        tony@atomide.com
Cc:     robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
        lokeshvutla@ti.com, nsekhar@ti.com, miquel.raynal@bootlin.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210914122705.15421-1-rogerq@kernel.org>
 <20210914122705.15421-9-rogerq@kernel.org>
 <e0c4759b-7c2d-e32c-f912-8409c1f65b49@canonical.com>
From:   Roger Quadros <rogerq@kernel.org>
Message-ID: <6a06f4bd-f20a-8b5a-c152-0877707670ff@kernel.org>
Date:   Wed, 15 Sep 2021 11:47:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e0c4759b-7c2d-e32c-f912-8409c1f65b49@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Krzysztof,

On 15/09/2021 10:12, Krzysztof Kozlowski wrote:
> On 14/09/2021 14:27, Roger Quadros wrote:
>> Check for valid gpmc,device-width, nand-bus-width and bank-width
>> at one place. Default to 8-bit width if none present.
>>
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>> ---
>>  drivers/memory/omap-gpmc.c | 41 ++++++++++++++++++++++++--------------
>>  1 file changed, 26 insertions(+), 15 deletions(-)
>>
> 
> All the comments from v3 are still applicable because it seems you
> ignored them. Please respond to them.
> 
> It's the second patch where the reviewer's comments got lost, so it
> creates rather poor impression.

I was wondering what comments and then realized that gmail server has put
all your messages into spam folder.

I'm very sorry about that. I will address your comments ASAP.

cheers,
-roger
