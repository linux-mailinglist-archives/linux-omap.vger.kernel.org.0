Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14A57126E97
	for <lists+linux-omap@lfdr.de>; Thu, 19 Dec 2019 21:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727140AbfLSUSa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 19 Dec 2019 15:18:30 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38255 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbfLSUSa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 19 Dec 2019 15:18:30 -0500
Received: by mail-ot1-f65.google.com with SMTP id d7so4306798otf.5;
        Thu, 19 Dec 2019 12:18:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tnn2lsnHNQAVXzxC0VXRfV3Skx5Qn0YuUG77RV4e1f4=;
        b=MlLfQ27jYD8FugMDHYcN6lVL3Lyw96pp6EJiem46n0XFtWcRa0pxTNbH1T3bkZKQeH
         6PhbyCoA5GPyXPHM1B1j6NxCyOX/V2sAUmCqVYjizAz8/V1Q4sHXNQyNyV7pq4Ps/npU
         dAPgxdx+elNEDKvqGPNH3TRUn3UT5ho38I18sKvWPvLtnj+JJ/Ho94n/j5Y8x73jF2p6
         woJi1x+tmKkaoKaDdEJEwbavLF31q5Bjakp1He/WM2qUs69BwJ66qIK5Q+uBPAsGMmN1
         xoB3DCsrqe9/d+FRg5zHU6AC5t1k/Tby7rveD3CDJlLR9XBbQsX0aOAvYFDaJF9OTS59
         /G+w==
X-Gm-Message-State: APjAAAWCafzJ5RyhvlYM2ft5G6yTaf8AmhViM97qpjP1Zm2uHa+Niz03
        eUCXruTOZrdgEfjAlhvBXzJL5eECiQ==
X-Google-Smtp-Source: APXvYqxBxkdP8NA5026YrHHwbHcnwnywi8+E25u6N1bsEKhsXXrdXsVbvnP8oXN7PytjtGNp+xBKnw==
X-Received: by 2002:a9d:784b:: with SMTP id c11mr10277222otm.246.1576786709659;
        Thu, 19 Dec 2019 12:18:29 -0800 (PST)
Received: from localhost (ip-184-205-110-29.ftwttx.spcsdns.net. [184.205.110.29])
        by smtp.gmail.com with ESMTPSA id q1sm2586004otr.40.2019.12.19.12.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 12:18:29 -0800 (PST)
Date:   Thu, 19 Dec 2019 14:18:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 1/5] clk: ti: clkctrl: Fix hidden dependency to node name
Message-ID: <20191219201822.GA19262@bogus>
References: <20191210172108.38868-1-tony@atomide.com>
 <20191210172108.38868-2-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191210172108.38868-2-tony@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 10 Dec 2019 09:21:04 -0800, Tony Lindgren wrote:
> We currently have a hidden dependency to the device tree node name for
> the clkctrl clocks. Instead of using standard node name like "clock", we
> must use "l4-per-clkctrl" type naming so the clock driver can find the
> associated clock domain. Further, if "clk" is specified for a clock node
> name, the driver sets TI_CLK_CLKCTRL_COMPAT flag that uses different
> logic for the clock name based on the parent node name for the all the
> clkctrl clocks for the SoC.
> 
> If the clock node naming dependency is not understood, the related
> clockdomain is not found, or a wrong one can get used if a clock manager
> has multiple clock domains.
> 
> As each clkctrl instance represents a single clock domain, let's allow
> using domain specific compatible names to specify the clock domain.
> 
> This simplifies things and removes the hidden dependency to the node
> name. And then later on, after the node names have been standardized,
> we can drop the related code for parsing the node names.
> 
> Let's also update the binding to use standard "clock" node naming
> instead of "clk" and add the missing description for reg.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  .../devicetree/bindings/clock/ti-clkctrl.txt  | 11 ++-
>  drivers/clk/ti/clk.c                          |  4 +-
>  drivers/clk/ti/clkctrl.c                      | 96 ++++++++++++++++---
>  3 files changed, 96 insertions(+), 15 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
