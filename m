Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3311921F5E9
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jul 2020 17:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbgGNPNN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Jul 2020 11:13:13 -0400
Received: from muru.com ([72.249.23.125]:36850 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725876AbgGNPNN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 14 Jul 2020 11:13:13 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B973680EB;
        Tue, 14 Jul 2020 15:13:09 +0000 (UTC)
Date:   Tue, 14 Jul 2020 08:13:09 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     dillon min <dillon.minfei@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Benoit Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] Fix dcan driver probe failed on am437x platform
Message-ID: <20200714151309.GT5849@atomide.com>
References: <1594708507-6794-1-git-send-email-dillon.minfei@gmail.com>
 <1594708507-6794-2-git-send-email-dillon.minfei@gmail.com>
 <20200714164504.10b23697@canb.auug.org.au>
 <CAL9mu0KRc1qNvW4xJj0cn_PoaumCnfdFVoneHja_B+2DPoRTSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL9mu0KRc1qNvW4xJj0cn_PoaumCnfdFVoneHja_B+2DPoRTSw@mail.gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* dillon min <dillon.minfei@gmail.com> [200714 07:03]:
> Hi Stephen,
> 
> Thanks for your patience, step by step help on my patch reviewing.

Thanks I'll update my fixes branch with v4 version.

Tony
