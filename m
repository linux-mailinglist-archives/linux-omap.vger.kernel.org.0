Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 647EC3AF49
	for <lists+linux-omap@lfdr.de>; Mon, 10 Jun 2019 09:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387702AbfFJHGG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 10 Jun 2019 03:06:06 -0400
Received: from muru.com ([72.249.23.125]:52402 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387614AbfFJHGG (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 10 Jun 2019 03:06:06 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C52FE807E;
        Mon, 10 Jun 2019 07:06:26 +0000 (UTC)
Date:   Mon, 10 Jun 2019 00:06:02 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Keerthy <j-keerthy@ti.com>
Cc:     robh+dt@kernel.org, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        t-kristo@ti.com
Subject: Re: [PATCH] arm: dts: dra72x: Disable usb4_tm target module
Message-ID: <20190610070602.GT5447@atomide.com>
References: <20190604061335.8264-1-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604061335.8264-1-j-keerthy@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Keerthy <j-keerthy@ti.com> [190603 23:13]:
> usb4_tm is unsed on dra72 and accessing the module
> with ti,sysc is causing a boot crash hence disable its target
> module.

Thanks for testing and fixing this, applying into fixes.

Tony
