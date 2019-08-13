Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 700168B554
	for <lists+linux-omap@lfdr.de>; Tue, 13 Aug 2019 12:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727959AbfHMKVm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Aug 2019 06:21:42 -0400
Received: from muru.com ([72.249.23.125]:57076 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727491AbfHMKVl (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 13 Aug 2019 06:21:41 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0DB9D805C;
        Tue, 13 Aug 2019 10:22:08 +0000 (UTC)
Date:   Tue, 13 Aug 2019 03:21:38 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Faiz Abbas <faiz_abbas@ti.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, mark.rutland@arm.com,
        robh+dt@kernel.org, bcousson@baylibre.com, kishon@ti.com
Subject: Re: [PATCH] ARM: dts: dra74x: Fix iodelay configuration for mmc3
Message-ID: <20190813102138.GI52127@atomide.com>
References: <20190807105238.21131-1-faiz_abbas@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807105238.21131-1-faiz_abbas@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Faiz Abbas <faiz_abbas@ti.com> [190807 03:53]:
> According to the latest am572x[1] and dra74x[2] data manuals, mmc3
> default, hs, sdr12 and sdr25 modes use iodelay values given in
> MMC3_MANUAL1. Set the MODE_SELECT bit for these so that manual mode is
> selected and correct iodelay values can be configured.

Thanks applying into fixes.

Tony
