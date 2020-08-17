Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1A892471E8
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 20:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390994AbgHQSfd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 14:35:33 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:46810 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390374AbgHQSfB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 14:35:01 -0400
Received: by mail-ej1-f65.google.com with SMTP id p24so18935064ejf.13;
        Mon, 17 Aug 2020 11:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=25dZbMPgS/dtX0tq95S1y5hallw1pJ+BnZq8+l7yBBk=;
        b=WYZcZMl9jD5emUqCpQZt3EZusuXtp17UCd0skHCOSOtDPRe9X6yef4DN0OCh7DH/S6
         AlUnTKv+BYUSqUeuwL2puXIjPoVvQ7F5AnKxJidlgB8ijtzr2N6Y7WrSKq/SIl0qpYwQ
         eu9+TNX7MK7W/LejGZgg267PLX0AwTJGRwQnUGxrsL4q+qwTgVdRqOzJlgdHOvVv8/QG
         KuYvgVOirejZ2twNSLQmIEdaBO5IRikifWfUbmVUSpbVi9bkSIgLxszFhvvA2XJnHnoA
         CDC+0yFmZWUJ3/lIJIT8+9sQVanU6nQmutgnNBtEUpQXB2H6ScRtVDtW/eb5s4/hY7xu
         rgBQ==
X-Gm-Message-State: AOAM533Lx+XgtTECEfgy0BXWWHIXujcDVd3VqdJoomQaWkdF1b33wY0x
        JBgSWVWDiaZ83bbPzDBai/M=
X-Google-Smtp-Source: ABdhPJyLwBm/IdtA1+1RvI4nnmFl21DUBXRImbwx4HPFsqBpPheiL+AX326IMCdzdk7su3JgiDNiww==
X-Received: by 2002:a17:906:4dc8:: with SMTP id f8mr16772438ejw.257.1597689299521;
        Mon, 17 Aug 2020 11:34:59 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id a18sm14817191ejt.69.2020.08.17.11.34.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Aug 2020 11:34:58 -0700 (PDT)
Date:   Mon, 17 Aug 2020 20:34:56 +0200
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
Subject: Re: [PATCH v2 24/29] memory: tegra: tegra210-emc: Fix indentation
Message-ID: <20200817183456.GF3464@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-25-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-25-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 24, 2020 at 09:40:33AM +0200, Krzysztof Kozlowski wrote:
> Use tabs instead of spaces for indentation.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/memory/tegra/tegra210-emc-cc-r21021.c | 2 +-

Applied.

Best regards,
Krzysztof

