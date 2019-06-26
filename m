Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E624156358
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2019 09:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbfFZHdz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Jun 2019 03:33:55 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:52655 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbfFZHdz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 Jun 2019 03:33:55 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id B585220039;
        Wed, 26 Jun 2019 09:33:51 +0200 (CEST)
Date:   Wed, 26 Jun 2019 09:33:50 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, David Airlie <airlied@linux.ie>,
        marek.belisko@gmail.com, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, tomi.valkeinen@ti.com,
        Thierry Reding <thierry.reding@gmail.com>,
        dri-devel@lists.freedesktop.org, letux-kernel@openphoenux.org
Subject: Re: [PATCH v3 0/5] drm/panel-simple: Add panel parameters for
 ortustech-com37h3m05dtc/99dtc and sharp-lq070y3dg3b
Message-ID: <20190626073350.GA15288@ravnborg.org>
References: <cover.1559905870.git.hns@goldelico.com>
 <0842FF88-D8E0-441B-837B-769C2EF6C1CB@goldelico.com>
 <20190625204356.GF18595@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625204356.GF18595@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=WeB7a6NEp7-J1G8srcAA:9 a=CjuIK1q_8ugA:10
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Nikolaus.

> > 
> > any progress towards merging this somewhere? It did not yet arrive in linux-next.
> > 
> > BTW: should also be applied to 5.2
> The drm bits are reviewed. The DT bits needs OK from DT people.
> When we have OK from DT people we can apply them all to drm-misc-next.

I got OK on irc from Rob to process these.
All patches are now applied to drm-misc-next.

	Sam
