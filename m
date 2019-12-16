Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0ACB711FD3D
	for <lists+linux-omap@lfdr.de>; Mon, 16 Dec 2019 04:32:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbfLPDcd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 15 Dec 2019 22:32:33 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:41040 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726551AbfLPDcd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 15 Dec 2019 22:32:33 -0500
Received: by mail-pj1-f66.google.com with SMTP id ca19so2337663pjb.8;
        Sun, 15 Dec 2019 19:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qpVTc4tcUglBIv/YUnNYtkmKTbZEgyX3F7tDT+7xZvU=;
        b=cFFTXy2vz5jh9KdiKKjPPBUP5mQwXiFWt91lRJv0f35dZUzhtz5BMXvSuZoqPMBCeW
         IeV2BqhciVRDPIBDCQz5lL0jENYLkOo5VuE45VV+bF0mx4YGJzxINbz86r+dXQ0Wkb0v
         8EUJBQE2tul8OHHvP/6SfcGqCndOBH2lPhs6IVIqBhGj7FYLDK35VEABGez1ov2KJFHt
         85QfmDabsYV2ZNPgZWUus/5ltcLculC5Dh0xsxdXfLuw3E06ZLTJFAhLBIvhn4CRDGu8
         imME8XCtbptxU4NUL1ytk1IoBobv9a0oX8BG0j/v++85mcEgvPHtwbUS3y8EiGTFyDUQ
         EJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qpVTc4tcUglBIv/YUnNYtkmKTbZEgyX3F7tDT+7xZvU=;
        b=ARx6tq13nvAfJMIXUnFYd1GyRMP1tnX2dNWSLvNKb3gQYD6hJxHI+6C3D3skM3YfcH
         LVY6flwPd9qIrkLyAD8AcTsNwkckXoO+CHIEN0T1n8zBWsp4JePrjA0yhieCXNgrwAlU
         iW8g40DEECWr5jA5WtO9syRzlnQsgx2bmcYo5wtdfb97y4NL8MVYrV82H+rfCq5ElQVv
         srbnETMdK9YZ1jV+r74tD+UIoVqhc4RHFzita3FYTgLZmNm0BNwnLe5fdr9+c/k2elS7
         SUV6HNcQMrQC7weJ0UA/ouMv3Ktt7lTRI2TK87h2i9LO8SBsGBQZ9OrqxIRFWhgjO6i6
         qGOg==
X-Gm-Message-State: APjAAAW5iQTdDkMa3rGJdDO1WdRBsJeRSfI5ONNKKFXSOnzcbVVpn2fG
        WtFvmzpxhuXqo6aVzIs2KS8=
X-Google-Smtp-Source: APXvYqyp9/I0lRWx3WKwBEci61s+yACCFwEJpSLYv/rp8GpXBQZNwGPKMtmRmjE3wBTDRRDGCXJaWQ==
X-Received: by 2002:a17:902:541:: with SMTP id 59mr13821692plf.190.1576467152279;
        Sun, 15 Dec 2019 19:32:32 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 78sm19052403pfu.65.2019.12.15.19.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 19:32:31 -0800 (PST)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     bcm-kernel-feedback-list@broadcom.com,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Stefan Wahren <wahrenst@gmx.net>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     linux@armlinux.org.uk,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-rpi-kernel@lists.infradead.org,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Subject: Re: [PATCH v3] ARM: bcm: Add missing sentinel to bcm2711_compat[]
Date:   Sun, 15 Dec 2019 19:32:30 -0800
Message-Id: <20191216033230.26652-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <b8f2060dacd4c4f27e0e1791cb12462ce740927d.1576396141.git.hns@goldelico.com>
References: <b8f2060dacd4c4f27e0e1791cb12462ce740927d.1576396141.git.hns@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, 15 Dec 2019 08:49:02 +0100, "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
> commit 781fa0a95424 ("ARM: bcm: Add support for BCM2711 SoC")
> 
> breaks boot of many other platforms (e.g. OMAP or i.MX6) if
> CONFIG_ARCH_BCM2835 is enabled in addition to some multiplatform
> config (e.g. omap2plus_defconfig). The symptom is that the OMAP
> based board does not show any activity beyond "Starting Kernel ..."
> even with earlycon.
> 
> Reverting the mentioned commit makes it work again.
> 
> The real fix is to add the missing NULL sentinel to the
> bcm2711_compat[] variable-length array.
> 
> Fixes: 781fa0a95424 ("ARM: bcm: Add support for BCM2711 SoC")
> Acked-by: Stefan Wahren <wahrenst@gmx.net>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---

Applied to soc/fixes, thanks!
--
Florian
