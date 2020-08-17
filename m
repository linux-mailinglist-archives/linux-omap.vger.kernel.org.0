Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BAB924717B
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 20:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390559AbgHQS2G (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 14:28:06 -0400
Received: from mail-ej1-f42.google.com ([209.85.218.42]:46672 "EHLO
        mail-ej1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390989AbgHQS1n (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 14:27:43 -0400
Received: by mail-ej1-f42.google.com with SMTP id p24so18905820ejf.13;
        Mon, 17 Aug 2020 11:27:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=In/lRzRecPXlJCsCXOUKVII8Zjza+KgDgAZ3qlg6NBY=;
        b=BiNY0ojzti9yNUev2nTtLyzk6JZBBxmgIw+89KBTyFJPtrX4kouSN9kpSTK7LkIxw2
         j9Pz/Kg8ccOg85UkfG1JklsNWKqwEDcH9s8+uPDlQJOZHK167K1pIqFzxB2EIaHNnu/7
         Izz4hP5YEr1K9D+smmSYDxyTr1LGSLPOCTNxeCT0GSo8fk8BhNySaDqd11UjPliaEV+W
         W4NvxcEExhA5BhevjU8msrwXKn20Fqx8SARrPe//BecWqABRKi3H5j+Dru1/PmLoX+kN
         dSYZGIbBYfxJJYyNJPxhrShNpqExYZzTAA/3lu70IktG29rcgmR3OSnN9XkFPUqMdKKr
         xmxg==
X-Gm-Message-State: AOAM530o9Q1Rio42tofLoq3ofktyTaDx9pf01Fb89irFHehNi0hx584A
        lUqKIcjqFLpdj7UPrbvfa+g=
X-Google-Smtp-Source: ABdhPJzlp7hrM7e8yK6q4U5Xo1UPtQg4hALTTyDbMtxYuqmsunf77TyReaLSnblPdWrAoapQvk48kw==
X-Received: by 2002:a17:906:54d3:: with SMTP id c19mr17313272ejp.408.1597688861304;
        Mon, 17 Aug 2020 11:27:41 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id p12sm13037482edt.27.2020.08.17.11.27.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Aug 2020 11:27:40 -0700 (PDT)
Date:   Mon, 17 Aug 2020 20:27:36 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Markus Mayer <mmayer@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kukjin Kim <kgene@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFT v2 01/29] memory: omap-gpmc: Remove unneeded
 asm/mach-types.h inclusion
Message-ID: <20200817182736.GA3464@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-2-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 24, 2020 at 09:40:10AM +0200, Krzysztof Kozlowski wrote:
> The driver does not use macros from asm/mach-types.h (neither MACH_TYPE
> nor machine_is_xxx()).  Removal of this include allows compile testing
> on non-ARM architectures which lack this header.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/memory/omap-gpmc.c | 2 --

Applied to drivers/memory tree.

Best regards,
Krzysztof

