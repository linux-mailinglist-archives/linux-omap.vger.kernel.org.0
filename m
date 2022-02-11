Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0646E4B2756
	for <lists+linux-omap@lfdr.de>; Fri, 11 Feb 2022 14:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349799AbiBKNpy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Feb 2022 08:45:54 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238948AbiBKNpy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Feb 2022 08:45:54 -0500
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF2D9E;
        Fri, 11 Feb 2022 05:45:53 -0800 (PST)
Received: by mail-qt1-f169.google.com with SMTP id y8so9017781qtn.8;
        Fri, 11 Feb 2022 05:45:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dgb78SMhlLckMxfKWnvYjMxeWU9PSdj/kJY8mvW63gw=;
        b=aKebTLzwSmkj2MZkTFmOf4uCdKYwBMBkliO5118EhKOE3DQegTBYo7bVjH3v0lmG1U
         VNdEC3gtW0Zk7VyKmuVRFxj/eZbhKDWaubO3d+h9foXQNcTbHheoV7L9lKzVt/fEoWn2
         K9Qfy+FMBBr+lOLzMDNeajnKCPAb89VAXREerYZb4vG492d1OBcjrusvmCPHJOT9P5WL
         I7+1EvfCMuBb/1xrVAc7h1hOEXxscCaAovYDhE9yWQ77mtjtfXXc2EuSeSIurGsQ2KIQ
         z5NQvkFQfY5uqaEon7sLCe7Uj7pk47WyiHPU+tSi1h9W/Y+IaKs1AIGmpx4h0dsnp8QQ
         6hkQ==
X-Gm-Message-State: AOAM533lXtxKp+Yp1+8YzDcxEpVtpn+FnB2Sn3njEcXzbXrnPdVrjFbJ
        aljR40IgZIxRjUk5W02TQtakIQdmGA==
X-Google-Smtp-Source: ABdhPJxV4tRG7Dqp23hahgNdfJfPz4fDXrmAwDpBOMKeBs5qPO1J/37Ao9XXE4Ahbwfpkj/pFq84qA==
X-Received: by 2002:ac8:5747:: with SMTP id 7mr1104603qtx.95.1644587152387;
        Fri, 11 Feb 2022 05:45:52 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:20dc:156b:8f01:9329:d9ca:df6f])
        by smtp.gmail.com with ESMTPSA id k13sm12364952qko.45.2022.02.11.05.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 05:45:51 -0800 (PST)
Received: (nullmailer pid 268371 invoked by uid 1000);
        Fri, 11 Feb 2022 13:45:46 -0000
Date:   Fri, 11 Feb 2022 07:45:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: ti: Drop legacy compatibility clocks for am3
Message-ID: <YgZoihEm2kBQ/orL@robh.at.kernel.org>
References: <20220203085618.16043-1-tony@atomide.com>
 <20220203085618.16043-2-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220203085618.16043-2-tony@atomide.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 03 Feb 2022 10:56:16 +0200, Tony Lindgren wrote:
> We no longer have users for the compatibility clocks and we can drop them.
> These are old duplicate clocks for what we using.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/clk/ti/Makefile          |   3 +-
>  drivers/clk/ti/clk-33xx-compat.c | 218 -------------------------------
>  drivers/clk/ti/clk-33xx.c        |   5 +-
>  drivers/clk/ti/clkctrl.c         |   8 +-
>  include/dt-bindings/clock/am3.h  |  93 -------------
>  5 files changed, 4 insertions(+), 323 deletions(-)
>  delete mode 100644 drivers/clk/ti/clk-33xx-compat.c
> 

Acked-by: Rob Herring <robh@kernel.org>
