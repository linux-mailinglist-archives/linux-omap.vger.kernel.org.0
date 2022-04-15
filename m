Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89DFC50272B
	for <lists+linux-omap@lfdr.de>; Fri, 15 Apr 2022 10:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241176AbiDOJCR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Apr 2022 05:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiDOJCQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 15 Apr 2022 05:02:16 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D664745AFB
        for <linux-omap@vger.kernel.org>; Fri, 15 Apr 2022 01:59:47 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id m15-20020a7bca4f000000b0038fdc1394b1so3885300wml.2
        for <linux-omap@vger.kernel.org>; Fri, 15 Apr 2022 01:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8/TXbsT8teCEmzE4dKBRkHwWmwMIpGUt/j6OmZyhVs8=;
        b=zcuSPMiyE4DadhWmqIxhMhkVRG1EODIESBPqrLgc1bDtVPYwKf3N4qAJwfMyMUJkJy
         qGP0rM6LvQPrcfInwuww1spzKroUuFjnsWyF7/AHnbfK7V9o59Z0q2CtscbBJMOUSdYl
         m+7uV7vHSa+xdCxbz5gw5rHfEkSzA6fH6X5LoasT6dp7/LV+N/CVM48pLD1vs/4AmkjO
         2XQXg1UHhsII2STcFhWN9d6vtkd+vOovWDJiG6gNBw7QiY+L6TObOEOdrzFxPlg+kVDp
         XAvrDDje+hSI8FuLzJ1sZsE/tokjKJ8zw9TPEHZBrlizPPazgjNukZdomX+7fvj3xsQE
         jBWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8/TXbsT8teCEmzE4dKBRkHwWmwMIpGUt/j6OmZyhVs8=;
        b=1eq8lghSNBTLEoOQVokBR1pN8iSYMV26ooB1b2lWvYcTKtxR7QOypVqWgOP0g1wY1K
         unxKP8i+eo3lmgjNUyBzK0CulPQzmcGRYH7LXqMviDeoAaGgxIRoBxNZnbJxU/YXA3i8
         7CbgVd8U75OAhOWZRgb4q1b7bXQUoVjVPewDP9qMWDyneaEvGtFKD08b4dyw/ZWMzf5M
         7bz1lEGy+QSEI+CLUpIAYQgc234JyyRBUOlWrynBp4zYwUIDXVTluUHGiiEgix+yVm6i
         1sNW6XaG5z6azmElCXu1E0vjJtsSA0JG0PLOLr7a5PFOaM9IoryNtoHj8GjM2DyvqjB+
         3BZQ==
X-Gm-Message-State: AOAM5309LZPIfLPhj9S9EmyRGdpD4fFMVbvSq5hUEC5dKuVsONM/YOs+
        qeHfHqufdNH7yNasSf8+DgohvA==
X-Google-Smtp-Source: ABdhPJxzM1b28MxcPYpVlkWFMBt4zpNJk7HpRWqFcxIiFvIoZonhstKNM9sMl32pcHIQU9hrh9BKtw==
X-Received: by 2002:a05:600c:29c7:b0:38e:c58d:7b00 with SMTP id s7-20020a05600c29c700b0038ec58d7b00mr2450360wmd.47.1650013186426;
        Fri, 15 Apr 2022 01:59:46 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f? (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
        by smtp.gmail.com with ESMTPSA id c18-20020a7bc852000000b0038ebf5f191esm9404929wml.45.2022.04.15.01.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Apr 2022 01:59:45 -0700 (PDT)
Message-ID: <371c1efe-8cff-8bab-8466-02efe4c3d155@smile.fr>
Date:   Fri, 15 Apr 2022 10:59:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 0/4] memory: omap-gpmc: Add AM64 SoC support
Content-Language: en-US
To:     Roger Quadros <rogerq@kernel.org>,
        krzysztof.kozlowski@canonical.com, miquel.raynal@bootlin.com,
        tony@atomide.com
Cc:     robh@kernel.org, kishon@ti.com, nm@ti.com, vigneshr@ti.com,
        linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org
References: <20211221131757.2030-1-rogerq@kernel.org>
From:   Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20211221131757.2030-1-rogerq@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello,

Le 21/12/2021 à 14:17, Roger Quadros a écrit :
> Hi,
> 
> TI's AM64 SoC contains one GPMC module. Add driver support for it.

What's the status of the GPMC interface on K3 architecture, especially for AM65,
AM62 and other Jacinto 7 CPU devices ?

TI currently don't recommend to use it for now even if there are still some GPMC
use case with FPGA devices:

https://e2e.ti.com/support/processors-group/processors/f/processors-forum/994191/am6442-am64x-gpmc-support

This patch series add omap-gpmc support for AM64 Soc but as of kernel 5.18-rc2,
there is no devicetree using ti,am64-gpmc.

This patch seems missing (at least):
https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-linux-5.10.y&id=55c102a75d399896c7396229cd687bf97afb5cf6

Thanks!

Best regards,
Romain

> 
> cheers,
> -roger
> 
> Changelog:
> v4
> - move compatible match table to header file so it can be used by
> GPMC driver even when NAND driver is not enabled or as a module.
> GPMC driver is always enabled as built-in.
> - Select OMAP_GPMC driver from MTD_NAND_OMAP2 driver config as
> OMAP_GPMC is not essential for ARCH_K3 boot.
> 
> v3
> - use compatible match table for checking for NAND controller node in
> GPMC driver.
> 
> v2
> - update DT binding doc to make reg-names and power-domains property
> required only for specific SoC.
> 
> Roger Quadros (4):
>   dt-bindings: memory-controllers: ti,gpmc: Add compatible for AM64
>   memory: omap-gpmc: Add support for GPMC on AM64 SoC
>   memory: omap-gpmc: Use a compatible match table when checking for NAND
>     controller
>   mtd: rawnand: omap2: Select GPMC device driver for ARCH_K3
> 
>  .../bindings/memory-controllers/ti,gpmc.yaml  | 23 +++++++++-
>  drivers/memory/omap-gpmc.c                    | 46 ++++++++++++++-----
>  drivers/mtd/nand/raw/Kconfig                  |  1 +
>  drivers/mtd/nand/raw/omap2.c                  |  5 +-
>  include/linux/platform_data/mtd-nand-omap2.h  |  9 +++-
>  5 files changed, 67 insertions(+), 17 deletions(-)
> 

