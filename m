Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09A642A62BB
	for <lists+linux-omap@lfdr.de>; Wed,  4 Nov 2020 11:57:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729437AbgKDK5R (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Nov 2020 05:57:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729654AbgKDK5O (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 4 Nov 2020 05:57:14 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD741C061A4A
        for <linux-omap@vger.kernel.org>; Wed,  4 Nov 2020 02:57:12 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id k10so20217082wrw.13
        for <linux-omap@vger.kernel.org>; Wed, 04 Nov 2020 02:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=NHw1cL4nU7m7k6IJhEyTVXOIiu4amLxGv+sgKD7ffvU=;
        b=CwB6ru04l9JRFWNgT7ToGncpo+HNGbYihFz4YCsmWH8ZwCWAtGvmQKZl0UYZI84HCV
         j9eKPJKKn3okZCfrTyC8Ea0YzVRCaEXfDZGSUDTlSJ9yTeyHK2IR7DZ0unfFMlhQoMZl
         BPuqTHkol7UHJdsz7iA/IsK/y5dyYtC99oBHQNyoDmOHIsA0RxAECXAh6p+qn4gyxyiC
         1NpYft9wA8sPh2TgtatNGWT77Ia/DRTznLI8gcLCVYClT83vJoOYcOSTAgtzE8/GK3eX
         mi+E1cE4hJ6uCLzVasUqcu691dq0hCfOMAk9pUx5nOxpBuqp9fPV2EStTVop4C2bpaWV
         eAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=NHw1cL4nU7m7k6IJhEyTVXOIiu4amLxGv+sgKD7ffvU=;
        b=ignqKP51/pgNTM8PMidiXKE79UpiEM4oiL7pPWnZJwciHbGGs/FselrhXi6YhCgeQC
         Y/gtI/3TqeLDU3PPhsF4wxkBvE4pdNAWjsUVjNCmFCVA4OWTrej4mATxEjoQztFWCnxF
         a8tffMhgE6x2RVX+0amJInlhOGxPyKi0ab1oPxvkLRfqPu3l9LvL2hnCjJozFze5YBM8
         Udkvz59W1Y06GNz58dmRTJsJZZFmd0pR38Ad0Wr1oDPk9Mdtg2ObiPPe9iukNc+NIDmM
         hIG7g9tT3itGJo3UR1yKt94RFkst3vT4DQv74sBOkFyimRCSfebUlcKruGuO9mzv/PGG
         XG3g==
X-Gm-Message-State: AOAM53236KtEJbtKurZI22pOFTs4u/YhpJLYMhHMG9C+ByAftETUGMCj
        1/Xsn+Qi7miRbgHUfwMd6oTuFA==
X-Google-Smtp-Source: ABdhPJw23+JmyqjHPIV3g1ngwlnPWgLkMEJtWfbcElDUL27lujHhGNbYDl5WsL2Jm/ZLLoRN/akwfg==
X-Received: by 2002:a5d:4f0b:: with SMTP id c11mr31202434wru.316.1604487431684;
        Wed, 04 Nov 2020 02:57:11 -0800 (PST)
Received: from dell ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id r3sm2037419wrm.51.2020.11.04.02.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 02:57:11 -0800 (PST)
Date:   Wed, 4 Nov 2020 10:57:09 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH 3/8] mfd: Constify static struct resource in OMAP2+
 drivers
Message-ID: <20201104105709.GU4488@dell>
References: <20200922192659.14535-1-rikard.falkeborn@gmail.com>
 <20200922192659.14535-4-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200922192659.14535-4-rikard.falkeborn@gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 22 Sep 2020, Rikard Falkeborn wrote:

> Constify a number of static struct resource. The only usage of the
> structs are to assign their address to the resources field in the
> mfd_cell struct. This allows the compiler to put them in read-only
> memory. Done with the help of Coccinelle.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> ---
>  drivers/mfd/tps65217.c | 4 ++--
>  drivers/mfd/tps65910.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
