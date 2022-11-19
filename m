Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35E8E630BDA
	for <lists+linux-omap@lfdr.de>; Sat, 19 Nov 2022 05:14:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbiKSEOM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Nov 2022 23:14:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230472AbiKSENW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Nov 2022 23:13:22 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D571942DD
        for <linux-omap@vger.kernel.org>; Fri, 18 Nov 2022 20:12:30 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id i29so2151921edj.11
        for <linux-omap@vger.kernel.org>; Fri, 18 Nov 2022 20:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w7tQQFuzfSDaPhrpS10Z2AmYKZc2634bkTMZZmcNW9w=;
        b=MNEQrnYN0CwjluQhpFBPdhcJLSSPJ5PvV+TedMFkoNnRFP5+pATyS+695oH/rEYhB2
         r3EwH9KXfhJLiarSxGIIbs1gK8imgBreybzaugftIHjoNPPbeYe2wrrqsp2LQyYLVYDO
         +680tgT57zm1bZcj+blxWl1j7aE6FC7G5nfTdJXM7KAi3Jj9OI0VDcGMNTiyG/I5yZb/
         Mq3U5iykInDWZnqBsUcwEsZYvzABz0zrGGE2FTpD+3RIbm6+sNSFUott6XDdJ6DGCLVe
         9Hd96acwlLO5LblDt7ecsJpnxyvaEL7KIcT0eIRg8wjCh0IfbTzb+DEHNV5IE/tS1uwu
         1FJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7tQQFuzfSDaPhrpS10Z2AmYKZc2634bkTMZZmcNW9w=;
        b=2Ytsjv6KrMoZckEdmcTa2xqahMXYqybJzW3A4xH1jKS71oigJNOSD9RU9CiObbxDst
         NnGgYOOwYhjiAglI0tXdggn4WZI0m90DENvEs+zhxo2muqsxxrzT79+mjNjZZSuP6vf1
         rxQFEIoGXQXfOBPulcTkz3hG+huRM5O6azi4sqC1vXTgZgAr814VQXtJLv0BY0yiQc1s
         OwApQTBupYUNdOyic/KX/cGNGTQcWiT0Jdzcu5zpz9vSRoRIyB1YNupvhi3LJ+/OMinV
         6iATcMxr8kqPo5256Uu3RomxASwGDL5Z5u0vWVWhqhoVZYD5y4zkv804689/1Kd/HGA8
         0WKQ==
X-Gm-Message-State: ANoB5pmSytARPB8X4djtqKT7/PxyDV9C3a6KrJalVvQrpwxLbqr5yZt+
        YENfRxmvIC4fTYmXJwRGMyo=
X-Google-Smtp-Source: AA0mqf5oFpecZM3YgieC+sI6iJUAcb5mR6ijkkRyrWR5HuxTP0qx/pMZqgtnxUoRX/i39vqVS792pA==
X-Received: by 2002:a05:6402:4:b0:463:cb99:5c8 with SMTP id d4-20020a056402000400b00463cb9905c8mr8519870edu.395.1668831148866;
        Fri, 18 Nov 2022 20:12:28 -0800 (PST)
Received: from tp440p.steeds.sam ([69.63.75.250])
        by smtp.gmail.com with ESMTPSA id ee47-20020a056402292f00b00468f7bb4895sm2216271edb.43.2022.11.18.20.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 20:12:28 -0800 (PST)
Date:   Sat, 19 Nov 2022 06:12:24 +0200
From:   Sicelo <absicsz@gmail.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 3/3] ARM: OMAP2+: Drop legacy hwmod data for omap3 otg
Message-ID: <Y3hXqL3lYt0f4ueZ@tp440p.steeds.sam>
References: <20221118104226.46223-1-tony@atomide.com>
 <20221118104226.46223-4-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118104226.46223-4-tony@atomide.com>
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Nov 18, 2022 at 12:42:26PM +0200, Tony Lindgren wrote:
> With complete devicetree data available to probe with ti-sysc interconnect
> target module driver, we can now drop the related SoC data.
> 
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Sicelo Mhlongo <absicsz@gmail.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Tested working on Nokia N900 (omap 3430). 

Tested-by: Sicelo A. Mhlongo <absicsz@gmail.com>

