Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3762B23C49
	for <lists+linux-omap@lfdr.de>; Mon, 20 May 2019 17:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392213AbfETPhp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 May 2019 11:37:45 -0400
Received: from muru.com ([72.249.23.125]:50176 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730766AbfETPhp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 20 May 2019 11:37:45 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 676CB806C;
        Mon, 20 May 2019 15:38:04 +0000 (UTC)
Date:   Mon, 20 May 2019 08:37:42 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Keerthy <j-keerthy@ti.com>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, t-kristo@ti.com
Subject: Re: [PATCH v2 0/4] dra71/76: Fix boot issues
Message-ID: <20190520153742.GF5447@atomide.com>
References: <20190517011409.22167-1-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190517011409.22167-1-j-keerthy@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Keerthy <j-keerthy@ti.com> [190516 18:14]:
> This series adds patches that fix boot on dra76/71-evms.
> 
> Changes in v2:
> 
>   * Pushed the disabling to dra76x and dra71x.dtsi respectively

Thanks applying into fixes.

Regards,

Tony
