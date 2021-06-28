Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DFC53B578F
	for <lists+linux-omap@lfdr.de>; Mon, 28 Jun 2021 04:56:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbhF1C7P (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 27 Jun 2021 22:59:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:59610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231678AbhF1C7P (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 27 Jun 2021 22:59:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3442861C29;
        Mon, 28 Jun 2021 02:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624849010;
        bh=JBdyWUe8fIp4N8uV6oiSpRPqgIGp9L3w0kNa6OeYPj8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=GyM7vzGuxsuZfe1r/YCiP72PJHe7nenx6wd1d2PyEQXBOgv/4wznl5FirkDIC7fjj
         Ca5tburTvEZ+sGqKmLHXXzlfMRyZsE5WemYqudfVS3xRE+DgqA4tbkyu2gvQjamF0j
         OajiykP+z493861a1/BTpEMm8f/J2CA7vcRmYaWRWS0ukxg+LYYU2HQ7A+IfalTIN1
         4j6bwHiJQcCkRf4vDraXxMoEvjuqZZSh00sNmBiCuhu4nRx8Tvv0Q1/uJc9LMeozzs
         TYFgat9Ysd4kmIZ5jvmQ8yLnM8+1RPBisRitYPKTLdKHupCgjLC63IssJY7M/Is7hP
         xoCb7KwYS4kHA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210616034826.37276-1-yujiahua1@huawei.com>
References: <20210616034826.37276-1-yujiahua1@huawei.com>
Subject: Re: [PATCH -next] drivers: ti: remove redundant error message in adpll.c
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yu Jiahua <yujiahua1@huawei.com>
To:     Yu Jiahua <yujiahua1@huawei.com>, kristo@kernel.org,
        mturquette@baylibre.com
Date:   Sun, 27 Jun 2021 19:56:48 -0700
Message-ID: <162484900892.2516444.13735398844442302580@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Quoting Yu Jiahua (2021-06-15 20:48:26)
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
>=20
> Signed-off-by: Yu Jiahua <yujiahua1@huawei.com>
> ---

Applied to clk-next
