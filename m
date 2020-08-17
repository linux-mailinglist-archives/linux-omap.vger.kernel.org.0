Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51D6D247209
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 20:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730586AbgHQShU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 14:37:20 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45976 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390329AbgHQShP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 14:37:15 -0400
Received: by mail-ed1-f66.google.com with SMTP id di22so13101765edb.12;
        Mon, 17 Aug 2020 11:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=r3OujnDYBJiMjjYF4tDkGDXWRYlpy502WI/tJfc+oIw=;
        b=AdiZG3DOxzwQcOXiC68Lm2Lw0MrcEChq7segwFnNK6zSXe9Kzj9AchQ04RtFUDinm9
         5rb0uzxrXlMrYsrGjwHrddfyqArWI9UZW4hHysYFV5jdm1tzz44IXTvOqIEBbzcTHkQ3
         VlvN0o8lbiap2v1IVWm3T174IrEXxBrRGH2eu2cb0ndfpPkvMexLlrVuVOJmYGLYdPsQ
         aaA9JFfu+TCyXRW/yxXi+n+TivwZVUBKoCDkjxviWLVFXgzr+ocSazEappoDwqu8CIeb
         2N1cDwl8mLUDobFbtqmqDHemiCTNhT3IvRuxZG+rEBApX6cKWz8+e8dxCfuFmNOWh3Ev
         1y5g==
X-Gm-Message-State: AOAM533rigNJZPlYelpXEHInRVur5DDKoTCS2tou3vmzvy8A7x7w7leC
        L8MBKmF26fGz0uh0Oeckpbw=
X-Google-Smtp-Source: ABdhPJwXp0oWcKnxB/vu/Vh1NkpFBtizO0iqHqdEUD+yH3nZv5VYR3Vw6iHDWpHXbr2EI4z3rHuuow==
X-Received: by 2002:a05:6402:b45:: with SMTP id bx5mr16373796edb.22.1597689433351;
        Mon, 17 Aug 2020 11:37:13 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id c7sm14179668edf.1.2020.08.17.11.37.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Aug 2020 11:37:12 -0700 (PDT)
Date:   Mon, 17 Aug 2020 20:37:09 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Markus Mayer <mmayer@broadcom.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kukjin Kim <kgene@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-pm@vger.kernel.orgq
Cc:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 10/16] memory: omap-gpmc: Consistently use !res for NULL
 checks
Message-ID: <20200817183709.GH3464@kozik-lap>
References: <20200724182328.3348-1-krzk@kernel.org>
 <20200724182328.3348-11-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200724182328.3348-11-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 24, 2020 at 08:23:22PM +0200, Krzysztof Kozlowski wrote:
> The driver already uses 'if (!res)' pattern in the probe function so be
> consistent.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/memory/omap-gpmc.c | 2 +-

Applied.

Best regards,
Krzysztof

