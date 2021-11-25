Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B008545D9CC
	for <lists+linux-omap@lfdr.de>; Thu, 25 Nov 2021 13:11:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240594AbhKYMPI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Nov 2021 07:15:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:34110 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240957AbhKYMNI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 25 Nov 2021 07:13:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67C4461057;
        Thu, 25 Nov 2021 12:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637842196;
        bh=4J4WHQF4+ox4W0Ntb6+xSi9bzNckSv0hkcp0qiE5qJc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=PuHwJC2PsB458gARqRKmm221wadaTEprtzFQQ+RYG4bBo1TFrvlhOZT/3boMZTcdq
         8Ch4YiMX7NpIdM9Fmd+Br82f7zNoK9ejxUeHGsSP10/+cOY6we57M9iC69QrFP9kte
         fWK/p/y2/1y7fTMSUfr6PtmEpKLZ1saWSWg/5lJlqzb7j0Jfqb93dWnudyoKKSyDz6
         wZtTFospYqDY7AZfh/YHlbjsl0zT7cVOiUvLpCU2Z/OPcZtEV+DduKTT4yOEfdRn2y
         HA9uNQtmYWKAb512JrnkDSfSdAzX5Z96Dp2BwVubnsvQsMED6Wd0YcO0FcMrWg3+nw
         uRfRbNd/E77fw==
Subject: Re: [PATCH 2/4] memory: omap-gpmc: Fix menuconfig visibility
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        tony@atomide.com
Cc:     kishon@ti.com, nm@ti.com, vigneshr@ti.com,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20211123102607.13002-1-rogerq@kernel.org>
 <20211123102607.13002-4-rogerq@kernel.org>
 <6a8f93a4-7390-1f1e-6ba0-601859c21ac0@canonical.com>
From:   Roger Quadros <rogerq@kernel.org>
Message-ID: <15a58477-5a8b-6236-be15-ce1d8226fdc8@kernel.org>
Date:   Thu, 25 Nov 2021 14:09:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <6a8f93a4-7390-1f1e-6ba0-601859c21ac0@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 23/11/2021 21:43, Krzysztof Kozlowski wrote:
> On 23/11/2021 11:26, Roger Quadros wrote:
>> GPMC was not being visible if COMPILE_TEST is not enabled.
>>
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>> ---
>>  drivers/memory/Kconfig | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
> 
> ... which was probably on purpose, similarly to many other SoC drivers
> which are selected by platform. Therefore there is no bug to fix here -
> lack of visibility is not a problem. Please document instead why you
> want to change it, e.g. why this is a problem or unwanted behavior.
> 

No strong enough reason. I'll drop this patch.

cheers,
-roger
