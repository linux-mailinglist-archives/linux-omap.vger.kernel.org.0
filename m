Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62F841785C4
	for <lists+linux-omap@lfdr.de>; Tue,  3 Mar 2020 23:40:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727429AbgCCWkS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Mar 2020 17:40:18 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:40629 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbgCCWkR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 Mar 2020 17:40:17 -0500
Received: by mail-oi1-f194.google.com with SMTP id j80so57773oih.7;
        Tue, 03 Mar 2020 14:40:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BqQd81PxAorJe3DrcyYS0OjbqqCAv2eTRW7X1U9wEb0=;
        b=lrSRooupdwoviV9rGvjj/NYDE8E3Uu8TMAyzyrcixaEyw1WcgkCnZImy5XH2067lZd
         FdjayrkCVPdPVjTcg93Udy92fB9IgS08RxhB+6ts0ZN3JGo+AcV7WWeKfB7MjImRUpzV
         QihiE6lkr0q0Iwd0EC/Vu/ZPWBHsdXzzF1Vde/bqLRyvOwv2AMZf4QEpG1bf/k+s1eJv
         l7Bruxsx/kw+t1OI9j/2IQqTB3fqpkdDTDTOWlfhHxP7Dfpm6JZ9D1Rfk5mvkuJpos3J
         IXAhXk8E/as68YlmX5eOG4iyCxI1LNWlQ2Aa6DoRHx3aGkz1IbMJBZ2N2JQkSVWbfAUH
         5mag==
X-Gm-Message-State: ANhLgQ0ijXKRMSGVC1IYldNUllCePQBRyRoK+s11k+NSjkmqkVnhzTrR
        hB7HJtCNZTOWi8+H3nE3+g==
X-Google-Smtp-Source: ADFU+vvr+K/q3LLOjA4PSsa3d6cNVzDbNdbXQcAvWmfJnwY3zuI0TCoJfLaefQAtE4lFsIxCgCk4bA==
X-Received: by 2002:aca:2104:: with SMTP id 4mr554313oiz.127.1583275215922;
        Tue, 03 Mar 2020 14:40:15 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g7sm8388947otk.17.2020.03.03.14.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 14:40:15 -0800 (PST)
Received: (nullmailer pid 22805 invoked by uid 1000);
        Tue, 03 Mar 2020 22:40:14 -0000
Date:   Tue, 3 Mar 2020 16:40:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: bus: ti-sysc: Add support for PRUSS
 SYSC type
Message-ID: <20200303224014.GA22749@bogus>
References: <20200227222837.7329-1-s-anna@ti.com>
 <20200227222837.7329-2-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227222837.7329-2-s-anna@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 27 Feb 2020 16:28:33 -0600, Suman Anna wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> The PRUSS module has a SYSCFG which is unique. The SYSCFG
> has two additional unique fields called STANDBY_INIT and
> SUB_MWAIT in addition to regular IDLE_MODE and STANDBY_MODE
> fields. Add the bindings for this new sysc type.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> v2: No changes
> 
>  Documentation/devicetree/bindings/bus/ti-sysc.txt | 1 +
>  include/dt-bindings/bus/ti-sysc.h                 | 4 ++++
>  2 files changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
