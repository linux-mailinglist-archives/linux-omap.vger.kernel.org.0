Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3242F67D1
	for <lists+linux-omap@lfdr.de>; Thu, 14 Jan 2021 18:36:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726110AbhANRfR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Jan 2021 12:35:17 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:58953 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbhANRfR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 14 Jan 2021 12:35:17 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610645694; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=9IYNUrVXzLK4CDgiFD5gCW/jwjuQjdTQHEdGD9cetfM=;
 b=pPTlu3qzBbwROKQfckl4GxbTaUwIL9XV4BgJ0K2RxV799543mEMrvTNaEcikx9LkFAn8LUG6
 xyLEx7AwZM4cZ11b59FzW9jtI1y0qNIufCsBs1HgsHFDWs2X9W5lzV1y5PNndyjXzdSMbTYQ
 Cku/vfKoJl+MMVtKMp6izW4EFg4=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyIwZGJlNiIsICJsaW51eC1vbWFwQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 600080b7c88af06107fc8fd7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 14 Jan 2021 17:34:47
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6942CC43462; Thu, 14 Jan 2021 17:34:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        MISSING_DATE,MISSING_MID,SPF_FAIL,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 82DF5C433CA;
        Thu, 14 Jan 2021 17:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 82DF5C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wlcore: Fix command execute failure 19 for wl12xx
From:   Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201231085343.24337-1-tony@atomide.com>
References: <20201231085343.24337-1-tony@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Eyal Reizer <eyalr@ti.com>, Guy Mishol <guym@ti.com>,
        Raz Bouganim <r-bouganim@ti.com>,
        linux-wireless@vger.kernel.org, linux-omap@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210114173446.6942CC43462@smtp.codeaurora.org>
Date:   Thu, 14 Jan 2021 17:34:46 +0000 (UTC)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Tony Lindgren <tony@atomide.com> wrote:

> We can currently get a "command execute failure 19" error on beacon loss
> if the signal is weak:
> 
> wlcore: Beacon loss detected. roles:0xff
> wlcore: Connection loss work (role_id: 0).
> ...
> wlcore: ERROR command execute failure 19
> ...
> WARNING: CPU: 0 PID: 1552 at drivers/net/wireless/ti/wlcore/main.c:803
> ...
> (wl12xx_queue_recovery_work.part.0 [wlcore])
> (wl12xx_cmd_role_start_sta [wlcore])
> (wl1271_op_bss_info_changed [wlcore])
> (ieee80211_prep_connection [mac80211])
> 
> Error 19 is defined as CMD_STATUS_WRONG_NESTING from the wlcore firmware,
> and seems to mean that the firmware no longer wants to see the quirk
> handling for WLCORE_QUIRK_START_STA_FAILS done.
> 
> This quirk got added with commit 18eab430700d ("wlcore: workaround
> start_sta problem in wl12xx fw"), and it seems that this already got fixed
> in the firmware long time ago back in 2012 as wl18xx never had this quirk
> in place to start with.
> 
> As we no longer even support firmware that early, to me it seems that it's
> safe to just drop WLCORE_QUIRK_START_STA_FAILS to fix the error. Looks
> like earlier firmware got disabled back in 2013 with commit 0e284c074ef9
> ("wl12xx: increase minimum singlerole firmware version required").
> 
> If it turns out we still need WLCORE_QUIRK_START_STA_FAILS with any
> firmware that the driver works with, we can simply revert this patch and
> add extra checks for firmware version used.
> 
> With this fix wlcore reconnects properly after a beacon loss.
> 
> Cc: Raz Bouganim <r-bouganim@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Failed to apply to wireless-drivers-next:

fatal: sha1 information is lacking or useless (drivers/net/wireless/ti/wl12xx/main.c).
error: could not build fake ancestor
Applying: wlcore: Fix command execute failure 19 for wl12xx
Patch failed at 0001 wlcore: Fix command execute failure 19 for wl12xx
The copy of the patch that failed is found in: .git/rebase-apply/patch

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201231085343.24337-1-tony@atomide.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

