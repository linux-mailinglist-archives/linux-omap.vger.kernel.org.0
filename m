Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 974A23D7183
	for <lists+linux-omap@lfdr.de>; Tue, 27 Jul 2021 10:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236035AbhG0Ity (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Jul 2021 04:49:54 -0400
Received: from muru.com ([72.249.23.125]:55666 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236037AbhG0Itv (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 27 Jul 2021 04:49:51 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 013C880F0;
        Tue, 27 Jul 2021 08:50:08 +0000 (UTC)
Date:   Tue, 27 Jul 2021 11:49:49 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc:     bcousson@baylibre.com, robh+dt@kernel.org,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, hns@goldelico.com
Subject: Re: [PATCH 0/3] ARM: dts / ti-sysc: Enable McASP on OMAP4
Message-ID: <YP/IrcaHwEoxD8iV@atomide.com>
References: <20210717120925.24505-1-peter.ujfalusi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210717120925.24505-1-peter.ujfalusi@gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Peter Ujfalusi <peter.ujfalusi@gmail.com> [210717 15:07]:
> Hi,
> 
> This series is the dts / ti-sysc part of the McASP DIT and OMAP4 support:
> https://lore.kernel.org/alsa-devel/20210705194249.2385-1-peter.ujfalusi@gmail.com/
> 
> The ASoC part has been picked up and it is in linux-next.
> 
> I have followed the advice from Tony and added a quirk via ti-sysc to disable the
> non working SIDLE mode for McASP.

Thanks applying all three.

Regards,

Tony
