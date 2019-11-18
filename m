Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1949F100A65
	for <lists+linux-omap@lfdr.de>; Mon, 18 Nov 2019 18:38:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfKRRiU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Nov 2019 12:38:20 -0500
Received: from mail-ot1-f45.google.com ([209.85.210.45]:40563 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbfKRRiU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 Nov 2019 12:38:20 -0500
Received: by mail-ot1-f45.google.com with SMTP id m15so15250150otq.7;
        Mon, 18 Nov 2019 09:38:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OPHeZ0ONb7QxOGjnxEqPGR9GP6+JqjS334aISM2h8GU=;
        b=G4Uug8A/oSWZmGbQnGT/DFTgCMNbZxoLMrCXf+gu33BX4l1Vjtw6moWvW3x4K9MnQw
         tsGAfEqjEKAm35S/KWzLBGvCLn97NI4lFouvKSIxc/1PPWoMe7K0JxfvI5rPJjYixQgT
         G4zyPxeZYpn7e7DIg4lXpzgost9KDWumi0S80rJdgaS9llhohxDvYgKcT94yZKWKDDZ4
         9eOkHerlyFVQwwFbdy6G8xuBMNQoUNPo+bgXF/TH3QfVwn8z8Bv1BGGPlh+vqACm894P
         FZnhLGduiCpqK2S4BTcP5jpS8EquDUGjDN3+zWaxbcjINYHqzFxeRh6CR9kg/+gzVdaB
         b2AQ==
X-Gm-Message-State: APjAAAVa+kEEssqjddTZeqos0ElZvKkpiTB/dg5IMcKijtGAUU7chNks
        IH4zjp/VITiUvUOEMuNRnQ==
X-Google-Smtp-Source: APXvYqw3tWOj5MbY9ztmdhsoNXwrQowUjyz8g9ciL4cSXNT28Yt+hGeB/JDI5JSerIw2w9s+s0L6Rw==
X-Received: by 2002:a9d:30d2:: with SMTP id r18mr352029otg.6.1574098699575;
        Mon, 18 Nov 2019 09:38:19 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 202sm6275752oii.39.2019.11.18.09.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 09:38:19 -0800 (PST)
Date:   Mon, 18 Nov 2019 11:38:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>,
        linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>
Subject: Re: [Patch v3 01/10] clk: ti: dra7: add cam clkctrl data
Message-ID: <20191118173818.GA4684@bogus>
References: <20191112142753.22976-1-bparrot@ti.com>
 <20191112142753.22976-2-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112142753.22976-2-bparrot@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 12 Nov 2019 08:27:44 -0600, Benoit Parrot wrote:
> Add clkctrl data for CAM domain.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/clk/ti/clk-7xx.c         | 19 +++++++++++++++++++
>  include/dt-bindings/clock/dra7.h | 10 ++++++++++
>  2 files changed, 29 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
