Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CD6F5A977C
	for <lists+linux-omap@lfdr.de>; Thu,  1 Sep 2022 14:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233214AbiIAM40 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Sep 2022 08:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233374AbiIAM4Z (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 1 Sep 2022 08:56:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46387844ED;
        Thu,  1 Sep 2022 05:56:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D52BD61EB5;
        Thu,  1 Sep 2022 12:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C65C433D6;
        Thu,  1 Sep 2022 12:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662036983;
        bh=rtmOTDFsRY/njnUGoX8E3adpbd4MAljbFKCwNEpru0w=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=XhOY55ZCnokxHrwNJFuSZ6yG2FA8bt4ZyY6O6VFgSJuKmOaZpVDv7rEOhHP1B9o6f
         FY96TEqTOzMWvnhXAzRyWpQgZOU26OpYogr9EVEGk/x4CIyS5SP1c0sH7z48Pvr5Wj
         nXh/+F5xDIvloUWsIV/UZa4+RlEmy6DEoc936wOqCuz7uu3Nl94BTS4F2DauAqDcis
         09GpmLwYbPbY6CPFY0FOWO+IvZNfjU3Oxy7UDLZnGz9nov6gW0gJzcViubeftEn5og
         AMM2Y08g8f/c6wgOOx6YUY2IfpFD4L8rtWUZDBFZT4/gJykS7aMBdCNeLCzch8Uo+n
         O/3OejnOSf2qQ==
Message-ID: <8b166d0d-2b09-55f6-8078-c791653f3349@kernel.org>
Date:   Thu, 1 Sep 2022 15:56:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/3] omap-gpmc wait pin additions
Content-Language: en-US
To:     "B. Niedermayr" <benedikt.niedermayr@siemens.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Cc:     rogerq@kernel.org, tony@atomide.com, robh+dt@kernel.org
References: <20220901124144.1006238-1-benedikt.niedermayr@siemens.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220901124144.1006238-1-benedikt.niedermayr@siemens.com>
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

On 01/09/2022 15:41, B. Niedermayr wrote:
> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> 
> There is currently no possibility for the gpmc to set either the
> waitp-pin polarity or use the same wait-pin for different cs-regions.
> 
> While the current implementation may fullfill most usecases, it may not
> be sufficient for more complex setups (e.g. FPGA/ASIC interfaces), where 
> more complex interfacing options where possible.
> 
> For example interfacing an ASIC which offers multiple cs-regions but
> only one waitpin the current driver and dt-bindings are not sufficient.
> 
> While using the same waitpin for different cs-regions worked for older
> kernels (4.14) the omap-gpmc.c driver refused to probe (-EBUSY) with
> newer kernels (>5.10). 

Please base your patches on a recent Linux kernel (judging by CC list
this is something old) - either current RC or linux-next.

Best regards,
Krzysztof
