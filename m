Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E10710FA8D
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2019 10:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbfLCJQI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Dec 2019 04:16:08 -0500
Received: from mga04.intel.com ([192.55.52.120]:42088 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725773AbfLCJQI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 3 Dec 2019 04:16:08 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Dec 2019 01:16:07 -0800
X-IronPort-AV: E=Sophos;i="5.69,272,1571727600"; 
   d="scan'208";a="204907667"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Dec 2019 01:16:04 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        intel-gfx@lists.freedesktop.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 07/14] video: omapfb: use const pointer for fb_ops
In-Reply-To: <dfa4376e219ffeef9175993eaff91b5fe7ecccab.1575022735.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1575022735.git.jani.nikula@intel.com> <dfa4376e219ffeef9175993eaff91b5fe7ecccab.1575022735.git.jani.nikula@intel.com>
Date:   Tue, 03 Dec 2019 11:16:00 +0200
Message-ID: <877e3dkbvz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 29 Nov 2019, Jani Nikula <jani.nikula@intel.com> wrote:
> Use const for fb_ops to let us make the info->fbops pointer const in the
> future.
>
> Cc: linux-fbdev@vger.kernel.org
> Cc: linux-omap@vger.kernel.org
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Pushed up to and including this patch to drm-misc-next, thanks for the
reviews and acks.

I may have missed some pointer chasing uses of info->fbops, reported by
0day. I'll need to double check those before proceeding with the next
patch.

BR,
Jani.

> ---
>  drivers/video/fbdev/omap/omapfb_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
> index 702cca59bda1..e8a304f84ea8 100644
> --- a/drivers/video/fbdev/omap/omapfb_main.c
> +++ b/drivers/video/fbdev/omap/omapfb_main.c
> @@ -1052,7 +1052,7 @@ static int omapfb_ioctl(struct fb_info *fbi, unsigned int cmd,
>  {
>  	struct omapfb_plane_struct *plane = fbi->par;
>  	struct omapfb_device	*fbdev = plane->fbdev;
> -	struct fb_ops		*ops = fbi->fbops;
> +	const struct fb_ops *ops = fbi->fbops;
>  	union {
>  		struct omapfb_update_window	update_window;
>  		struct omapfb_plane_info	plane_info;

-- 
Jani Nikula, Intel Open Source Graphics Center
