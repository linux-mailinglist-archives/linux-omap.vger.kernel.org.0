Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC342C847E
	for <lists+linux-omap@lfdr.de>; Mon, 30 Nov 2020 13:57:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbgK3M4w (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Nov 2020 07:56:52 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52178 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgK3M4w (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Nov 2020 07:56:52 -0500
Received: by mail-wm1-f66.google.com with SMTP id v14so12788383wml.1;
        Mon, 30 Nov 2020 04:56:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KA4FsL6sn3u9jrJsiA+gD1uye6Iim3RFu2p2YxR5doU=;
        b=t35lH+nrLE9vOa5lQC6RBI2o+sxf6hj/diMhm+3xT6IrXnW4zr5AChZGuIem8KY2rv
         bHlAoON1r0JQ1R6x82VSZjJXlH4tkcA6919u2rBzmW+va/iwxjrxDTnFqhIzRzXhEdkR
         xWCL5E+/ow1uP2W1pfOC7Z2P/wqCgOKGw78Jcc8B+6KmzsH/llNIXpYf+VbIWzyW5J8v
         wM0Oy0Z0GuqCUe8pq8EhStqVvjXHQ8GpZxGbGxyWUKdCPsSF3TKLDbzLUVQI58nLFauK
         Hi7LG0fVtKdATtLETrhi7K6Rt7rUs/cEAc1WSnWBTmqPmOQpwTHCw7lsLrmv+ClNdkVX
         jBAQ==
X-Gm-Message-State: AOAM532Ny4jAtSJLanTnBY+ixIiAREAY3LmkBVBQyH4T5rajaaYhyui9
        jPgS7EiyPIOD4R0vJXlQaDBBT9d4BX8=
X-Google-Smtp-Source: ABdhPJyB4tRlVY5fdsHYIvsg/T0WzycMSlnq0700hz6hSeNk15HX/TJ+Blb86Fx5OFgX1vHysPSt1g==
X-Received: by 2002:a05:600c:1497:: with SMTP id c23mr22664768wmh.86.1606740969972;
        Mon, 30 Nov 2020 04:56:09 -0800 (PST)
Received: from pi3 (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id b14sm26864894wrq.47.2020.11.30.04.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 04:56:08 -0800 (PST)
Date:   Mon, 30 Nov 2020 13:56:06 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Cc:     tony@atomide.com, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Nishanth Menon <nm@ti.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH] ARM: omap2plus_defconfig: drop unused POWER_AVS option
Message-ID: <20201130125606.GA22699@pi3>
References: <20201130124233.32569-1-andrey.zhizhikin@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130124233.32569-1-andrey.zhizhikin@leica-geosystems.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Nov 30, 2020 at 12:42:33PM +0000, Andrey Zhizhikin wrote:
> Commit 785b5bb41b0a ("PM: AVS: Drop the avs directory and the
> corresponding Kconfig") moved AVS code to SOC-specific folders, and
> removed corresponding Kconfig from drivers/power, leaving original
> POWER_AVS config option enabled in omap2plus_defconfig file.
> 
> Remove the option, which has no references in the tree anymore.
> 
> Fixes: 785b5bb41b0a ("PM: AVS: Drop the avs directory and the corresponding Kconfig")
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>

I thought you will squash it with multi_v7, but it's fine this way.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
