Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43E25427133
	for <lists+linux-omap@lfdr.de>; Fri,  8 Oct 2021 21:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241068AbhJHTMQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Oct 2021 15:12:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:50726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241089AbhJHTMP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 8 Oct 2021 15:12:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9DD6960F4F;
        Fri,  8 Oct 2021 19:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633720219;
        bh=Z2ygsEMYLO/VXWnyBFIGSRh1kDJ8bQcJPSg13l9qSjI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=MiE2hoxFy1mIniC8bw230X+w+0L3PDqWqsJUnhZ2geQe2uTeT1xMdMlzCA2EtICah
         XZDB3AQAv1zN1ApwJXUwn9cosA0xE+lB2UeACXUb/0cMffJG2oiZfH/gOB4yHPhcWn
         UUgnL/e77mYxnJE8uR/N6EZPIEu8hzxSy3QCAtmNDMxtHBjs45L7ykfw8yMMEYkJk4
         0DBYr1wNFb1pelpbV6pktXehflcIWE3Y87i3r0HETDUcSmWVBpwGjOegT1bSGGNPFT
         FENWjhRkq3saCptID9BG6f176aFvm5KPTqB1ToVIzxiiEXTHxmYi/koBqtntjfcRYB
         ksyIKq8tW+Oww==
Subject: Re: [PATCH v5 0/8] dt-bindings: memory-controllers: ti,gpmc: Convert
 to yaml
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        tony@atomide.com,
        =?UTF-8?Q?Miqu=c3=a8l_Raynal?= <miquel.raynal@bootlin.com>
Cc:     robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
        lokeshvutla@ti.com, nsekhar@ti.com, miquel.raynal@bootlin.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211007120830.17221-1-rogerq@kernel.org>
 <6b90a6fd-001f-a41a-b69f-2bd3ec8a8e26@canonical.com>
From:   Roger Quadros <rogerq@kernel.org>
Message-ID: <e165b6ee-91d3-3a50-3b9d-3f15fa82a101@kernel.org>
Date:   Fri, 8 Oct 2021 22:10:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6b90a6fd-001f-a41a-b69f-2bd3ec8a8e26@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Krzysztof,

On 07/10/2021 20:37, Krzysztof Kozlowski wrote:
> On 07/10/2021 14:08, Roger Quadros wrote:
>> Hi,
>>
>> This series converts ti,gpmc memory controller and ti,gpmc-nand and
>> ti,gpmc-onenand MTD controller bindings to yaml.
>>
>> cheers,
>> -roger
>>
> 
> Hi,
> 
> Although you did not mention it here, it looks like you have some
> dependencies between the patches. Maybe this shall go simply via Rob's tree?
> 

Rob has acked all the DT binding patches.
So it is upto you and Miquèl to decide the best way. MTD tree or Memory controller tree
for the dt-bindings patches.

The ARM: dts changes should go via Tony's OMAP SoC tree.

Or if Tony is OK with it then maybe all patches can go via Tony's tree? :)

cheers,
-roger

