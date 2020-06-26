Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3958420B233
	for <lists+linux-omap@lfdr.de>; Fri, 26 Jun 2020 15:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbgFZNLb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 Jun 2020 09:11:31 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:54907 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725900AbgFZNLb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Fri, 26 Jun 2020 09:11:31 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id oo8Ujk7Anrl4Boo8XjQtdv; Fri, 26 Jun 2020 15:11:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593177088; bh=dDTqvoVPnl/pmSvidq/qlFTOa9ekNrCG6UHyS0C8VJM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=K/QOWNtIlpLmbSCZnTcizawGzbU7WvMd1xTx3XdHYPZW/JsGowAMFKqSvmGgbnrTU
         wmGkrehfPoxlj0BUnIjJk6FRdZjAgmv6fjZQjRHIobbWpr53ikCDx1+nd/z/mPyfl0
         ZzTIjPGEJkOovolkTHvh693+ke1+Z+aPkyUeUIxBpH4mqsVd6dLlBjrAvwrPY/ewH6
         jW9flZH7vUlQEtUZObxN+YCmf6G2pos4Sv4eslqowXdLBUYiLz32FC0540X6oU2m2g
         gJ8XxjXv4CqDD7/9CJy2ldwuOdDqpbO5x6epvJCXdUpR4q0HpMJgd6TWEZs+FyONXn
         DOFYBIsgJyJvw==
Subject: [PATCH 8/7] arch/arm/configs: remove obsolete CONFIG_SOC_CAMERA*
To:     linux-media@vger.kernel.org
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>
References: <20200626115321.1898798-1-hverkuil-cisco@xs4all.nl>
 <20200626115321.1898798-8-hverkuil-cisco@xs4all.nl>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <8c9e0509-38c6-2013-740f-56b9e229d837@xs4all.nl>
Date:   Fri, 26 Jun 2020 15:11:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200626115321.1898798-8-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKmObcerpWUZ+2pleOnSCiXEcEC4Pcrr7od+w3IEYfol3NZNXiEKhkJRdjUEl60UIplCrIQDhU/o8grbT01RWnFC/OHWKxDrvwYeJWbB0DpjjuLdz6PD
 BdsmLnOKdZxkJlfQY59PFdJNgn4NFw3PuSW2lLuMSvjBDSZ5/FdbSqQuT80PARwVANeOjOsKYgtehkswhF38rVgtNzHqzT+cZpvvoOHSupLurmDi2KzkeMaM
 b6Ny8entb1d5ZadJfkxuBSJz5pmNiEQC0w6wBoBKMUQ2JaWNKd9b3opRLM4ZRzV+
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Drop all configs with the CONFIG_SOC_CAMERA prefix since those
have been removed.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 arch/arm/configs/ezx_defconfig       | 2 --
 arch/arm/configs/imote2_defconfig    | 2 --
 arch/arm/configs/imx_v4_v5_defconfig | 1 -
 arch/arm/configs/imx_v6_v7_defconfig | 1 -
 arch/arm/configs/pxa_defconfig       | 3 ---
 arch/arm/configs/sama5_defconfig     | 2 --
 6 files changed, 11 deletions(-)

diff --git a/arch/arm/configs/ezx_defconfig b/arch/arm/configs/ezx_defconfig
index bd7b7f945e01..81665b7abf83 100644
--- a/arch/arm/configs/ezx_defconfig
+++ b/arch/arm/configs/ezx_defconfig
@@ -236,8 +236,6 @@ CONFIG_MEDIA_TUNER_CUSTOMISE=y
 # CONFIG_MEDIA_TUNER_MXL5007T is not set
 # CONFIG_MEDIA_TUNER_MC44S803 is not set
 # CONFIG_VIDEO_HELPER_CHIPS_AUTO is not set
-CONFIG_SOC_CAMERA=y
-CONFIG_SOC_CAMERA_MT9M111=y
 CONFIG_VIDEO_PXA27x=y
 # CONFIG_V4L_USB_DRIVERS is not set
 CONFIG_RADIO_TEA5764=y
diff --git a/arch/arm/configs/imote2_defconfig b/arch/arm/configs/imote2_defconfig
index 05c5515fa871..ae15a2a33802 100644
--- a/arch/arm/configs/imote2_defconfig
+++ b/arch/arm/configs/imote2_defconfig
@@ -217,8 +217,6 @@ CONFIG_MEDIA_TUNER_CUSTOMISE=y
 # CONFIG_MEDIA_TUNER_MXL5007T is not set
 # CONFIG_MEDIA_TUNER_MC44S803 is not set
 # CONFIG_VIDEO_HELPER_CHIPS_AUTO is not set
-CONFIG_SOC_CAMERA=y
-CONFIG_SOC_CAMERA_MT9M111=y
 CONFIG_VIDEO_PXA27x=y
 # CONFIG_V4L_USB_DRIVERS is not set
 # CONFIG_RADIO_ADAPTERS is not set
diff --git a/arch/arm/configs/imx_v4_v5_defconfig b/arch/arm/configs/imx_v4_v5_defconfig
index 3df90fc38398..f5f1111f2118 100644
--- a/arch/arm/configs/imx_v4_v5_defconfig
+++ b/arch/arm/configs/imx_v4_v5_defconfig
@@ -110,7 +110,6 @@ CONFIG_REGULATOR_MC13892=y
 CONFIG_MEDIA_SUPPORT=y
 CONFIG_MEDIA_CAMERA_SUPPORT=y
 CONFIG_V4L_PLATFORM_DRIVERS=y
-CONFIG_SOC_CAMERA=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_CODA=y
 CONFIG_FB=y
diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 87e6400c436b..38968b862630 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -271,7 +271,6 @@ CONFIG_MEDIA_USB_SUPPORT=y
 CONFIG_USB_VIDEO_CLASS=m
 CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_VIDEO_MUX=y
-CONFIG_SOC_CAMERA=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_CODA=m
 CONFIG_VIDEO_IMX_PXP=y
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index e6559e3350e6..aa94d22df0aa 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -445,11 +445,8 @@ CONFIG_VIDEO_V4L2_SUBDEV_API=y
 CONFIG_MEDIA_USB_SUPPORT=y
 CONFIG_USB_VIDEO_CLASS=m
 CONFIG_V4L_PLATFORM_DRIVERS=y
-CONFIG_SOC_CAMERA=m
-CONFIG_SOC_CAMERA_PLATFORM=m
 CONFIG_VIDEO_PXA27x=m
 CONFIG_V4L_MEM2MEM_DRIVERS=y
-CONFIG_SOC_CAMERA_MT9M111=m
 CONFIG_DRM=m
 CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_TILEBLITTING=y
diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
index 8e1f78c19920..012812d6bb33 100644
--- a/arch/arm/configs/sama5_defconfig
+++ b/arch/arm/configs/sama5_defconfig
@@ -148,9 +148,7 @@ CONFIG_REGULATOR_PWM=m
 CONFIG_MEDIA_SUPPORT=y
 CONFIG_MEDIA_CAMERA_SUPPORT=y
 CONFIG_V4L_PLATFORM_DRIVERS=y
-CONFIG_SOC_CAMERA=y
 CONFIG_VIDEO_ATMEL_ISI=y
-CONFIG_SOC_CAMERA_OV2640=m
 CONFIG_DRM=y
 CONFIG_DRM_ATMEL_HLCDC=y
 CONFIG_DRM_PANEL_SIMPLE=y
-- 
2.27.0


