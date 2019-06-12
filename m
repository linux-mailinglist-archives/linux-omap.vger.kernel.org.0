Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C950441E99
	for <lists+linux-omap@lfdr.de>; Wed, 12 Jun 2019 10:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436786AbfFLIE5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Jun 2019 04:04:57 -0400
Received: from muru.com ([72.249.23.125]:52878 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436780AbfFLIE4 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 12 Jun 2019 04:04:56 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 0666A80E2;
        Wed, 12 Jun 2019 08:05:17 +0000 (UTC)
Date:   Wed, 12 Jun 2019 01:04:53 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     yegorslists@googlemail.com
Cc:     linux-omap@vger.kernel.org, bcousson@baylibre.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: am335x-baltos: add support for MMC1 CD pin
Message-ID: <20190612080453.GD5447@atomide.com>
References: <20190611141338.14787-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611141338.14787-1-yegorslists@googlemail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* yegorslists@googlemail.com <yegorslists@googlemail.com> [190611 07:14]:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Baltos 5221/3220 devices provide CD signal on GPIO2_18.
> Baltos 2110 device provides CD signal on GPIO1_15.

Applying into omap-for-v5.3/dt thanks.

Tony
