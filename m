Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 394F6380546
	for <lists+linux-omap@lfdr.de>; Fri, 14 May 2021 10:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232211AbhENIcD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 14 May 2021 04:32:03 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:43904 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229704AbhENIcD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Fri, 14 May 2021 04:32:03 -0400
Received: from [77.244.183.192] (port=63198 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1lhTDf-000EnW-5g
        for linux-omap@vger.kernel.org; Fri, 14 May 2021 10:30:51 +0200
From:   Luca Ceresoli <luca@lucaceresoli.net>
Subject: Status of ti/ti-linux-5.10.y development
To:     linux-omap@vger.kernel.org
Message-ID: <78852763-4bc3-dc59-02c4-b3b07584c0ed@lucaceresoli.net>
Date:   Fri, 14 May 2021 10:30:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

I hope this is the proper place for this question. If it isn't: my
apologies, and I'd be glad to be redirected where appropriate.

I currently have a prototype board based on AM5728 that is mostly
working, using branch ti/ti-linux-4.19.y of the TI kernel [0].

Now I need some non-TI-specific kernel features that appeared in
mainline 5.10, so I tried to move to branch ti/ti-linux-5.10.y. But many
components that I am using on the 4.19 branch seem absent on the 5.10
branch, including VIDEO_TI_VIP, DRM_OMAP_WB and DRM_OMAP_CONNECTOR_HDMI.

BTW they are not present even in mainline Linux.

Are this drivers still absent and in progress of being added to
ti/ti-linux-5.10.y, or are they present in a different form that I have
been unable to find?

Assuming they still have to be added, is there an estimate timing for
their availability on the 5.10 branch?

[0] git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git

-- 
Luca
