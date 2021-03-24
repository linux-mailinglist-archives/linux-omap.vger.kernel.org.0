Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB24347817
	for <lists+linux-omap@lfdr.de>; Wed, 24 Mar 2021 13:17:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbhCXMQp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Mar 2021 08:16:45 -0400
Received: from muru.com ([72.249.23.125]:46570 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232964AbhCXMQQ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 24 Mar 2021 08:16:16 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B707F8057;
        Wed, 24 Mar 2021 12:17:10 +0000 (UTC)
Date:   Wed, 24 Mar 2021 14:16:10 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Hanna Hawa <hhhawa@amazon.com>
Cc:     andy.shevchenko@gmail.com, haojian.zhuang@linaro.org,
        linus.walleij@linaro.org, dwmw@amazon.co.uk, benh@amazon.com,
        ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, tgershi@amazon.com,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] pinctrl: pinctrl-single: remove unused variable
Message-ID: <YFstiokDhGVPhAh6@atomide.com>
References: <20210319152133.28705-1-hhhawa@amazon.com>
 <20210319152133.28705-2-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319152133.28705-2-hhhawa@amazon.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Hanna Hawa <hhhawa@amazon.com> [700101 02:00]:
> Remove unused parameter 'num_pins_in_register' from
> pcs_allocate_pin_table().

Reviewed-by: Tony Lindgren <tony@atomide.com>
