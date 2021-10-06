Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 938354238E8
	for <lists+linux-omap@lfdr.de>; Wed,  6 Oct 2021 09:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237384AbhJFHcp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Oct 2021 03:32:45 -0400
Received: from muru.com ([72.249.23.125]:41340 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233968AbhJFHcp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 6 Oct 2021 03:32:45 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7DE6580E7;
        Wed,  6 Oct 2021 07:31:23 +0000 (UTC)
Date:   Wed, 6 Oct 2021 10:30:51 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     bcousson@baylibre.com, robh+dt@kernel.org,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: omap3: fix cpu thermal label name
Message-ID: <YV1Qq6N0VJVIHK79@atomide.com>
References: <20211001135908.2913378-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001135908.2913378-1-andreas@kemnade.info>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andreas Kemnade <andreas@kemnade.info> [211001 16:59]:
> Hyphens should be used in label names. make dtbs_check complains
> about that since it does not match the corresponding pattern

Thanks applying into omap-for-v5.16/dt.

Tony
