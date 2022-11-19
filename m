Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8C5630BC3
	for <lists+linux-omap@lfdr.de>; Sat, 19 Nov 2022 05:12:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234215AbiKSEMf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Nov 2022 23:12:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232702AbiKSEMF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Nov 2022 23:12:05 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 271AA99EB2
        for <linux-omap@vger.kernel.org>; Fri, 18 Nov 2022 20:11:10 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id n20so17640051ejh.0
        for <linux-omap@vger.kernel.org>; Fri, 18 Nov 2022 20:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PO7ro7iTZbLS6biz+7KxXJFO5nsbjD6gE6gtjnXwheg=;
        b=dcfSyYmDNLp9yO4izMUbV5JJVdlqdanqvGZw1jH2URt1E+jkWvz51L8dNqOcdWXd4T
         LbzmwMspStR4O9MR2McCM5OqB0VRvzBnlgeqIFAkyFky+utBp4MEDOV6z89JaAbkCUpc
         xOWBgJHZy7TFXdiNzs/YGU2O/JtLTwr+fNuvJunPWsUvUhoq9hTuaDGMvNT+VugEofpw
         Kxdew3bkzJ3mH/ziqS1WWTOLPYjhD89NdmLUIV+eE4dEBI9rlsALdJ7lGj0CxfX70bmt
         aDtTcHDCsqzeD1XFHxiBT8IOFPjhB3pIr7A9xKwGxZmveqaFnjYgIFcAl84Ywxaqcv6/
         n5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PO7ro7iTZbLS6biz+7KxXJFO5nsbjD6gE6gtjnXwheg=;
        b=wiQH2ItKUFW32z0Q28pzgw4T02bSKZ1qvmL+JjHuOJ/LhAGZ5NWAVdIioi8UBVJbqd
         pdiKfBPz6rP8jIhImdZ78gid/2F2kiM114PRvUujxIdFqEJnl38RrrOBZrnkqTG7J7Tx
         4pwhhRV73GQNvUMq2iOUL79YtIzjWk6b15DeJ0ZNw6C9o51MZxsK+EyNlo9Il9xnr4er
         AVeLUJLZrq7s/e1pe+bcwYSk4zP24Vh7gjUdeCdvRo3YzqrxtgOH6UQOoxW2P8hOqD25
         P4ZdOKM6P9AdzwkQapbF98e4y4DUc2fp8YRlRf/yK5blCZ+r/Gjvga/rkg+BrpdAQTEN
         j6Dg==
X-Gm-Message-State: ANoB5pmpTf0smwAD9HXK1ORYGAEypjy4NSsF3DOT+00IrK7yzU26ooSL
        ZWCaVtlRu8OnNKgu8CMBpwlqFHG4pkYtJhnY
X-Google-Smtp-Source: AA0mqf7btJOb5zY7yOGjwoRnqzTjaxtm60NQEeLrc81hUOxafzZs1gRFmN3QPJFRGSsU7oxwD8kfqw==
X-Received: by 2002:a17:906:2854:b0:7ae:3684:84b0 with SMTP id s20-20020a170906285400b007ae368484b0mr278575ejc.622.1668831068657;
        Fri, 18 Nov 2022 20:11:08 -0800 (PST)
Received: from tp440p.steeds.sam ([69.63.75.250])
        by smtp.gmail.com with ESMTPSA id qh9-20020a170906eca900b00795bb7d64d8sm2423990ejb.217.2022.11.18.20.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 20:11:08 -0800 (PST)
Date:   Sat, 19 Nov 2022 06:11:04 +0200
From:   Sicelo <absicsz@gmail.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/3] ARM: dts: Update omap3 musb to probe with ti-sysc
Message-ID: <Y3hXWDsqDcH0jCDJ@tp440p.steeds.sam>
References: <20221118104226.46223-1-tony@atomide.com>
 <20221118104226.46223-3-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118104226.46223-3-tony@atomide.com>
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

On Fri, Nov 18, 2022 at 12:42:25PM +0200, Tony Lindgren wrote:
> We can drop the legacy booting for the related musb driver if we update
> the omap3 SoCs variants to boot using ti-sysc interconnect target module.
> 
> devicetree@vger.kernel.org
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Sicelo Mhlongo <absicsz@gmail.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Tested-by: Sicelo A. Mhlongo <absicsz@gmail.com>

