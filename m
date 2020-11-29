Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3DE72C7B7D
	for <lists+linux-omap@lfdr.de>; Sun, 29 Nov 2020 22:55:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727543AbgK2VzI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 29 Nov 2020 16:55:08 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:40296 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726512AbgK2VzI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 29 Nov 2020 16:55:08 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 61BBD2002C;
        Sun, 29 Nov 2020 22:54:21 +0100 (CET)
Date:   Sun, 29 Nov 2020 22:54:20 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     trix@redhat.com
Cc:     b.zolnierkie@samsung.com, pakki001@umn.edu,
        linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] omapfb: fbcon: remove trailing semicolon in macro
 definition
Message-ID: <20201129215420.GE1162850@ravnborg.org>
References: <20201127190508.2842786-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201127190508.2842786-1-trix@redhat.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Ibmpp1ia c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=20KFwNOVAAAA:8 a=lSec57_JDs9yAHf9QvQA:9
        a=CjuIK1q_8ugA:10 a=HngZt1h-djAA:10
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tom,
On Fri, Nov 27, 2020 at 11:05:08AM -0800, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> The macro use will already have a semicolon.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks, applied to drm-misc-next.

	Sam
