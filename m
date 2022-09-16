Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1105E5BA88D
	for <lists+linux-omap@lfdr.de>; Fri, 16 Sep 2022 10:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbiIPIvH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 16 Sep 2022 04:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230486AbiIPIu4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 16 Sep 2022 04:50:56 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B69A831C;
        Fri, 16 Sep 2022 01:50:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 91C09B8236E;
        Fri, 16 Sep 2022 08:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C53B7C433C1;
        Fri, 16 Sep 2022 08:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663318246;
        bh=r3bkzNMOCn2xHdYiUy9dIp4wjERKZqka5pJYVf/I0rE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=mFsfWg59Jflzdl04r8/e8bgPyQp/zW8a6jH+HWVMGCVLFH7109JOaKXxd3IcmmWD1
         7thXhgZ372v2aGadCyXjih8SJ7VYhw4OKBv6EIex7DEeefYQrHbuH8MtOf0T57sTGd
         syTXxJm5+Zj4CM+7dxh7W314VNk5TrIlLibezAJFjKwtYO+Gh+Psfbfpsfuks8ycOU
         sHjSJ6bO3AVZ++YVxFhRNeBIWDlJht9Nij5cmSWLUxFtW8FQbeHLOGBN+o1eaUERlC
         W8zNCap7AuXAVRLgZrH5VDJt80/de5RZYUkwbK8uI3N5l6cL8CpBjQM3lbAxmlo1Qr
         KzK9l/ZD0LSfg==
Message-ID: <6c8f1bfd-2aab-c9e3-4fe8-2e555b969e3a@kernel.org>
Date:   Fri, 16 Sep 2022 11:50:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 1/3] memory: omap-gpmc: allow shared wait pins
Content-Language: en-US
To:     "B. Niedermayr" <benedikt.niedermayr@siemens.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Cc:     tony@atomide.com, krzysztof.kozlowski@linaro.org,
        robh+dt@kernel.org
References: <20220915091333.2425306-1-benedikt.niedermayr@siemens.com>
 <20220915091333.2425306-2-benedikt.niedermayr@siemens.com>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20220915091333.2425306-2-benedikt.niedermayr@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 15/09/2022 12:13, B. Niedermayr wrote:
> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> 
> Newer kernels refuse to probe when using the same wait pin for
> different chipselect regions.
> 
> But this may be a usecase when connecting for example FPGA or ASIC
> modules to the gpmc, which only got one wait pin installed.
> 
> Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> ---
>  drivers/memory/omap-gpmc.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
> index d9bf1c2ac319..e3674a15b934 100644
> --- a/drivers/memory/omap-gpmc.c
> +++ b/drivers/memory/omap-gpmc.c
> @@ -2221,9 +2221,13 @@ static int gpmc_probe_generic_child(struct platform_device *pdev,
>  							 GPIO_ACTIVE_HIGH,
>  							 GPIOD_IN);
>  		if (IS_ERR(waitpin_desc)) {
> -			dev_err(&pdev->dev, "invalid wait-pin: %d\n", wait_pin);
>  			ret = PTR_ERR(waitpin_desc);
> -			goto err;
> +			if (ret == -EBUSY) {
> +				dev_info(&pdev->dev, "shared wait-pin: %d\n", wait_pin);

What if this GPI was taken by someone other than us for wait-pin usage?
e.g. some other device driver for GPI usage?

In that case that GPIO functionality will break if we now start using it for wait-pin usage. Right?

One solution could be keep track if we reserved that pin for wait-pin usage
and if so sharing the wait-pin for wait-pin usage is fine.

> +			} else {
> +				dev_err(&pdev->dev, "invalid wait-pin: %d\n", wait_pin);
> +				goto err;
> +			}
>  		}
>  	}
>  

cheers,
-roger
