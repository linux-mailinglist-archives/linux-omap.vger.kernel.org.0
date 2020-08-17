Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94A392471D6
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 20:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391252AbgHQSe1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 14:34:27 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:44781 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391240AbgHQSeZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 14:34:25 -0400
Received: by mail-ed1-f67.google.com with SMTP id l23so13109546edv.11;
        Mon, 17 Aug 2020 11:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UUC1YYZepwSIaUyyVu4p4E8C9yxfTbr1IBllNcE9Kwk=;
        b=MfTodjseBuS7qqDtmiWPCIgpUvtP/0UwCzMnny0IurDp290oNe8STUEYE7hKiqNHXZ
         kMDeclKuI+X92y4L1/9Z0LDFUwEdjffxpytT27CiT1XXItmYo5aYLBeUHDk+9agNLexO
         iTxlZnlRx2tzW8PROX0IQSrnvDbasSLhmt1OwCxgttLJ8WTrJCdkU68DyyyMT6z5fSBK
         XQgftOCCPuGs5SefZl1Ubo7neu7sXDg9Lq+d7GGtimAqbJEk0awobqBIF2/CFf34y/sh
         aXJxtui+SaNnnwZiL39zrHf7gWZqvsHmmggWos4CmS5wxmQ7swhUj9MrPOaLrQL7SkGB
         SI3g==
X-Gm-Message-State: AOAM530sqIz7whrlSuNrOUviwwV3DxYMB4qmjlP81r5sP9TFZIef9hFt
        i/TUsTQ358QSwz2bh6x6wWw=
X-Google-Smtp-Source: ABdhPJyMkkS73tARItUdlMSiGOG9MxnnjtabQxaD28LAXhwot6oVxwb23In6Y3s0rvfq+6XG+6YFUQ==
X-Received: by 2002:aa7:c50b:: with SMTP id o11mr15637355edq.59.1597689262974;
        Mon, 17 Aug 2020 11:34:22 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id ss20sm14764697ejb.118.2020.08.17.11.34.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Aug 2020 11:34:22 -0700 (PDT)
Date:   Mon, 17 Aug 2020 20:34:19 +0200
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
Subject: Re: [PATCH v2 16/29] memory: renesas-rpc-if: Simplify with
 PTR_ERR_OR_ZERO
Message-ID: <20200817183419.GE3464@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-17-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-17-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 24, 2020 at 09:40:25AM +0200, Krzysztof Kozlowski wrote:
> Use PTR_ERR_OR_ZERO to make the code a little bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/memory/renesas-rpc-if.c | 4 +---

Applied.

Best regards,
Krzysztof

