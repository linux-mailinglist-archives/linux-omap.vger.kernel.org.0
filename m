Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A63EE38C2F5
	for <lists+linux-omap@lfdr.de>; Fri, 21 May 2021 11:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236160AbhEUJXO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 May 2021 05:23:14 -0400
Received: from muru.com ([72.249.23.125]:58352 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236127AbhEUJXN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 21 May 2021 05:23:13 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id AFE6280C0;
        Fri, 21 May 2021 09:21:54 +0000 (UTC)
Date:   Fri, 21 May 2021 12:21:46 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     Rob Herring <robh@kernel.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Nishanth Menon <nm@ti.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mailbox: Convert omap-mailbox.txt binding
 to YAML
Message-ID: <YKd7qky2QXZubE3x@atomide.com>
References: <20210518172022.10562-1-s-anna@ti.com>
 <c666919f-cc10-3ca5-a1e3-5062c260e827@ti.com>
 <20210520000831.GA3927464@robh.at.kernel.org>
 <f60764c8-9100-0c8d-96d6-76689ed8acc6@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f60764c8-9100-0c8d-96d6-76689ed8acc6@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Suman Anna <s-anna@ti.com> [210520 16:45]:
> Tony,
> Do you have/foresee any concerns with the patches in [2]?

Looks OK to me, will be picking them up.

Regards,

Tony

> [2] https://patchwork.kernel.org/project/linux-omap/list/?series=484489
