Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E61D65F339
	for <lists+linux-omap@lfdr.de>; Thu,  5 Jan 2023 18:55:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234237AbjAERzJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Jan 2023 12:55:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235418AbjAERzJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Jan 2023 12:55:09 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C74C154DBB
        for <linux-omap@vger.kernel.org>; Thu,  5 Jan 2023 09:55:08 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id c9so21002151pfj.5
        for <linux-omap@vger.kernel.org>; Thu, 05 Jan 2023 09:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cRswEoLcvNg+EwAJnmlk9CwmDwKYgv8FuVAKCR8LhjM=;
        b=KOA7hRj4EfmXmKhwx6AbTsq6VqSJbEtu8YXvH6QBc/cwRoOm2VotNGO9fXKXLcvVqO
         GMYSj3lEnia1lYHZ3POuYeBh4t9OClqZOZrZVFI5iWtvy36I2CVrRVIrqZO2vRfdZijx
         K4ewE1iy6ePV3zh60Lrqehjm4mEOGz3Pi81Cl+MF+AF3T78GQHMg3EcqLupkvceDv/Vm
         fc7SjUOH/FPBMquRS2xwuS3F4lN3EJ9wKGSLBtalqigaskP5qokrl8ZoH3l5o2rveQSa
         d31DJv+nC9tYAARFpV0diuEVCOAlRY7xNP+qTtnnWBNk8w9/n86faD18L6A11CrfjcEs
         lcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cRswEoLcvNg+EwAJnmlk9CwmDwKYgv8FuVAKCR8LhjM=;
        b=pl7RdsHjNIX9EmwSvQMEYnwuCaLTqWNpM228Edk9B3syGfdhM6JVVhl1C+wFsFxNvT
         /5o1OuZIUKvOrN8nZQozczUymrxpbNKCCQYPFHfwrMYe/Au+Teo8NQKDw602Wa4FdJeW
         Ew4bXlre2Nk3ef12k+qyGVxm5w+9NIv4cGq4ippI0kDVzwR1MNp2FQk7L9/pAJ6ZDMjm
         tB3eKOUxypRYmPeP6M4Ata1i3NChxopUWPYMsgf5rk8OGBD+6deUSXLQuTe2fmPtqsfk
         Fzyqp6e4N8Gf7VFKbpOITzkvLbfbwWdExGEMlS76hqs2ITVi8g7mO4sr1w4lBquVKrPd
         PWKA==
X-Gm-Message-State: AFqh2kqpCo/WFi2E+w3smv28Jgzv3qkVm3yRH75AeiAQYe1J64NcSwKC
        Gjv3zxCxSHUVV9Q4s3VgmcFB8biCOXewINT3lBx7C/9unAw=
X-Google-Smtp-Source: AMrXdXtPG44qFPhz/nSkocovU1lDQd9Y7OF/i+KR3Hu52JnvzeghZAJnMcCR6Fwm6vVguu2/AN1nKE/uzAJy/YOrUA4=
X-Received: by 2002:a65:674e:0:b0:48d:a8d8:6f73 with SMTP id
 c14-20020a65674e000000b0048da8d86f73mr2367828pgu.396.1672941307760; Thu, 05
 Jan 2023 09:55:07 -0800 (PST)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 5 Jan 2023 11:54:56 -0600
Message-ID: <CAHCN7xJT+1XP-LHyzj0GB5rDnVP+EgGmUVb6h4uTJA4bVE1yPg@mail.gmail.com>
Subject: omap_hsmmc RX DMA errors
To:     Linux-OMAP <linux-omap@vger.kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Kishon Vijay Abraham I <kishon@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I am trying to test the 6.0 kernel on an AM3517-EVM, but I am seeing
some DMA RX errors:

[    1.730682] omap_hsmmc 4809c000.mmc: RX DMA channel request failed
[    1.738403] omap_hsmmc 480b4000.mmc: RX DMA channel request failed

I tried changing the omap3.dtsi file to use the newer sdhci-omap
controller instead of the older hsmmc driver since it has support for
the omap3.  That seemed to fix the issue:

[    2.141967] omap-dma-engine 48056000.dma-controller: OMAP DMA engine driver
[    2.183074] mmc1: SDHCI controller on 480b4000.mmc [480b4000.mmc]
using External DMA
[    2.184631] mmc0: SDHCI controller on 4809c000.mmc [4809c000.mmc]
using External DMA

Would there be an objection if I migrate the OMAP3.dtsi file to the
newer driver?  I wasn't sure if there was a reason this family was
being held back from the newer driver.

thanks

adam
