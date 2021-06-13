Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48B553A59ED
	for <lists+linux-omap@lfdr.de>; Sun, 13 Jun 2021 20:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232000AbhFMSFc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 13 Jun 2021 14:05:32 -0400
Received: from 49-237-179-185.static.tentacle.fi ([185.179.237.49]:55372 "EHLO
        bitmer.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231997AbhFMSFc (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 13 Jun 2021 14:05:32 -0400
Received: from 88-114-184-142.elisa-laajakaista.fi ([88.114.184.142] helo=[192.168.1.42])
        by bitmer.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <jarkko.nikula@bitmer.com>)
        id 1lsUSE-0005HD-Cs; Sun, 13 Jun 2021 21:03:26 +0300
From:   Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: Regression? omap2plus_defconfig bloat due drivers/media/Kconfig
 changes
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>
Message-ID: <2d389925-db9d-58f5-7928-0baa5f187afb@bitmer.com>
Date:   Sun, 13 Jun 2021 21:03:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi

I noticed omap2plus_defconfig build is much slower than before and I saw
during build many DVB drivers were compiled. Which made me thinking it
doesn't look right especially there are no changes in
arch/arm/configs/omap2plus_defconfig related to DVB.

I tracked manually last good and first bad
arch/arm/configs/omap2plus_defconfig change.

This was tested by "make ARCH=arm omap2plus_defconfig" and grepping is
CONFIG_DVB_CORE set in .config.

good: 8b136018da7b ("mm: rename CONFIG_PGTABLE_MAPPING to
CONFIG_ZSMALLOC_PGTABLE_MAPPING")
bad: 8aa6361f7251 ("ARM: omap2plus_defconfig: enable twl4030_madc as a
loadable module")

Then I started bisecting which commit adds CONFIG_DVB_CORE and found
commit 8e5b5d75e9d0 ("media: Kconfig: DVB support should be enabled for
Digital TV").

That alone didn't look the answer so bisected then commit adding
MEDIA_DIGITAL_TV_SUPPORT and found c6774ee035dc ("media: Kconfig: make
filtering devices optional").

I'm not familiar with media subsystem but after that commit bunch of
media drivers will get enabled when CONFIG_MEDIA_SUPPORT is set but not
CONFIG_MEDIA_SUPPORT_FILTER.

I don't know is that best to fix in omap2plus_defconfig or
drivers/media/Kconfig. Just thinking if there are other minimal
defconfigs with the same issue?

Jarkko
