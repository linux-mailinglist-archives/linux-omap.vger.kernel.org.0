Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CABD85A9846
	for <lists+linux-omap@lfdr.de>; Thu,  1 Sep 2022 15:16:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234267AbiIANNj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Sep 2022 09:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234042AbiIANM0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 1 Sep 2022 09:12:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA1CB140A5;
        Thu,  1 Sep 2022 06:11:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A74F061F11;
        Thu,  1 Sep 2022 13:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF714C433B5;
        Thu,  1 Sep 2022 13:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662037904;
        bh=Z5awdLMmOyIN9NBetZ6w+d+kKbn0VBkAz+qr/7o8Ces=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=uJ+NAa3MlulTlfWT3+DGhI97XUA3XvEGaCSThZd+W2e1dtmaX8OAzNx2T4A+0kkkL
         2R3G4qhLlh/sZTq6ovbRhfJEUvD701agU9h18oxOXPe6Wbp5jX6rBAX9DUCcf7hqrm
         eZzP4KjuTeNib30XwNBqM51X7XmEkzyA6akm36InrbfaHyAP59CWxlFa9EDJ2Rdhvn
         r50Hs86k7/t8RlyopO5KACrQmLIBS5/KGN4BniHlzvOePrZ8uAzn7Fa9EEXSulTJ59
         Fs7GQKimcCy5e2Q02uyfCIcAXSkolNTrbvDbgY/JoMN1hREU6c9T3OvWHK7zCWt5o1
         93kE6x/0I5GXw==
Message-ID: <57d81862-4d09-58a0-37f9-67efca8c210b@kernel.org>
Date:   Thu, 1 Sep 2022 16:11:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/3] omap-gpmc wait pin additions
Content-Language: en-US
To:     "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Cc:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
References: <20220901124144.1006238-1-benedikt.niedermayr@siemens.com>
 <8b166d0d-2b09-55f6-8078-c791653f3349@kernel.org>
 <3ff40d3634db34e0e58762029e5e6bc950a29f43.camel@siemens.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <3ff40d3634db34e0e58762029e5e6bc950a29f43.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 01/09/2022 16:02, Niedermayr, BENEDIKT wrote:
> On Thu, 2022-09-01 at 15:56 +0300, Krzysztof Kozlowski wrote:
>> On 01/09/2022 15:41, B. Niedermayr wrote:
>>> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
>>>
>>> There is currently no possibility for the gpmc to set either the
>>> waitp-pin polarity or use the same wait-pin for different cs-
>>> regions.
>>>
>>> While the current implementation may fullfill most usecases, it may
>>> not
>>> be sufficient for more complex setups (e.g. FPGA/ASIC interfaces),
>>> where 
>>> more complex interfacing options where possible.
>>>
>>> For example interfacing an ASIC which offers multiple cs-regions
>>> but
>>> only one waitpin the current driver and dt-bindings are not
>>> sufficient.
>>>
>>> While using the same waitpin for different cs-regions worked for
>>> older
>>> kernels (4.14) the omap-gpmc.c driver refused to probe (-EBUSY)
>>> with
>>> newer kernels (>5.10). 
>>
>> Please base your patches on a recent Linux kernel (judging by CC list
>> this is something old) - either current RC or linux-next.
>>
>> Best regards,
>> Krzysztof
> 
> 
> ... and create a v2 patch series then?

Just for updating email addresses - no need. If the code was rebased and
tested on something old, then yes, please.

Best regards,
Krzysztof
