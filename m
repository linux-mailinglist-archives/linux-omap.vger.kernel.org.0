Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEBAF2A74EF
	for <lists+linux-omap@lfdr.de>; Thu,  5 Nov 2020 02:33:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730883AbgKEBdX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Nov 2020 20:33:23 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:53100 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730812AbgKEBdX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 4 Nov 2020 20:33:23 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4CRQyS3Fwdz8p;
        Thu,  5 Nov 2020 02:33:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1604540001; bh=8HZujv+B9glFMO2jIpcGlrIyBcBkf4Sxyjc0+yqd5Ts=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SBqUY90c81QWrd00llbDujyB9JGO3jQsXx9jLs3NzdBjbzcRTt66hTsRFgIDVJQFt
         Q/uvCtEvZXYILOW2eJf5Lab49xCnqVwG1FM0aH6y6YPmS4MG/D9voHyhbbCS/HkcTF
         JbFzgQzyGB7uapvZS9X3foAiu61r9Oa4Mwpye9SXV69mttRgWMSsnsglEVJZhpThG2
         4l2MEQ2S57GDHTCoJzilogEM49k8oRwsbilxjulxJsZf1HpWSH9TsIN0m4gPESjAKH
         I1uOJeW75KedrlCTNksdNa8l3Zo0hzCw/zDnMKRwOgQkdRtsGmN7sFaqEPDACNnlXN
         +WRLFoHLpKl5g==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Thu, 5 Nov 2020 02:33:19 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Zack Pearsall <zpearsall@yahoo.com>,
        linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mfd: tps65910: Correct power-off programming sequence
Message-ID: <20201105013319.GA17266@qmqm.qmqm.pl>
References: <20201104134408.19911-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201104134408.19911-1-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Nov 04, 2020 at 04:44:08PM +0300, Dmitry Osipenko wrote:
> This patch fixes system shutdown on a devices that use TPS65910 as a
> system's power controller. In accordance to the TPS65910 datasheet, the
> PMIC's state-machine transitions into the OFF state only when DEV_OFF
> bit of DEVCTRL_REG is set. The ON / SLEEP states also should be cleared,
> otherwise PMIC won't get into a proper state on shutdown. Devices like
> Nexus 7 tablet and Ouya game console are now shutting down properly.
[...]

You might want to rebase on https://lkml.org/lkml/2020/9/26/397 as it's
probably going to be accepted shortly. This just means replacing
register accesses: tps65910_reg_*() -> regmap_*().

Best Regards,
Micha³ Miros³aw
