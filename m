Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 888062D4F97
	for <lists+linux-omap@lfdr.de>; Thu, 10 Dec 2020 01:39:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbgLJAhL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Dec 2020 19:37:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729748AbgLJAhH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Dec 2020 19:37:07 -0500
Received: from mail.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D44BCC0613CF;
        Wed,  9 Dec 2020 16:36:27 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:601:9f00:477:9e51:a893:b0fe:602a])
        by mail.monkeyblade.net (Postfix) with ESMTPSA id B68214D259C19;
        Wed,  9 Dec 2020 16:36:25 -0800 (PST)
Date:   Wed, 09 Dec 2020 16:36:25 -0800 (PST)
Message-Id: <20201209.163625.1798210949270866738.davem@davemloft.net>
To:     zhengyongjun3@huawei.com
Cc:     kuba@kernel.org, linux-afs@lists.infradead.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH net-next] net: ethernet: ti: convert comma to semicolon
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20201209133716.1290-1-zhengyongjun3@huawei.com>
References: <20201209133716.1290-1-zhengyongjun3@huawei.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2 (mail.monkeyblade.net [0.0.0.0]); Wed, 09 Dec 2020 16:36:26 -0800 (PST)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Zheng Yongjun <zhengyongjun3@huawei.com>
Date: Wed, 9 Dec 2020 21:37:16 +0800

> Replace a comma between expression statements by a semicolon.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Applied.
