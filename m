Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1683F7D1494
	for <lists+linux-omap@lfdr.de>; Fri, 20 Oct 2023 19:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbjJTRJf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 20 Oct 2023 13:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjJTRJe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 20 Oct 2023 13:09:34 -0400
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 755D4A3
        for <linux-omap@vger.kernel.org>; Fri, 20 Oct 2023 10:09:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697821757; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=O1TdGQu70RToXWTKWhJ+omxpp/9ptaopaIQ04s1rYiQRxX91iqaYUdT68QhAyyBBju
    ZSSuJ3y1/poEDiCeeYNY9Y9imf0lyxHalcX4bt15eXgKJxA5WQ01KVxZSgvKxfQURB0u
    RIuYb2ATKAFY2wnk5+VIs/60NXKC4nW8g/Bb/w7P0QHQmIXYI8uUCtoLXVqiS3zeda68
    mGOSnjORakTCedeyhyofHCvBY7/kEcvpSyGMhdJ/uJArlwJ8YbJSK6BMHlFpfqEb6E8h
    83IlcphwfP7DVnPEtYEBu56JpL4ai45W80kQfFLCuaJh8PqxfFoUdGQ/Y3PuM9rhxwjj
    KWhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1697821757;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:To:Cc:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=5RQJ1xl1yN+Oq3cuLl1q2ndUXnoeTOq+CMtNTlPjr2M=;
    b=RJFxlwaKnFopy+XVxVfNL3MAphhp5fz/+ouwkxDX3fWpm43yVLezaZc970qbI/NC/1
    k/uRkskqzAvH12PKBniFrYAaf06FE7ypWT4d4G38PdFzfJReRE67yNc3gieCv0S1SGsv
    y4BJUtwmEKBTg5t4c/EvKWqRBQofzDrkdVQLodbejARj8LbwUv7HOW4fIdQ4RAO5BAT7
    IMHa+EghrYoF+KBDbX463jqyhEM0m10lm2M92kvtnot8GgUpbK4VtDIMpck1Qr62ZTa4
    kstvk0gcc318RE++ABhLZIgS/CzNOLYduT6XhwUMXY81QyheVPrXMquLOdEcrbb4Hb+7
    Dx4g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1697821757;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-Id:To:Cc:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=5RQJ1xl1yN+Oq3cuLl1q2ndUXnoeTOq+CMtNTlPjr2M=;
    b=rMyNc2JI7YmfN3ysLqnUqcVf95i2CTg5JKMiKeu04byhB3Irokrz55V6sQGbTWmM6f
    st+vwNs19NJO0ADHUYSTB0gWvAcZfgGDtOnN1B0KLaJ7ofY6e9+NghUBTUNWypFiab8j
    f5advP9cE+1p/BAV2WaQ1W2n6XYF3RJTCM9tk8StgIAuIJnd6PYWAhkoSiTkSwDjxiOj
    Yb2h3A4HWFYh/ytwP96UvSTIXElOfeumLuUaVUFcdtffuvL5HM3JlcREH/8LqDIb7zjc
    BuhNXR2700F+k2qiZnhdUDm0JE0nM2AX90747faSNAgFv3AMoFJCJtIspI43P9E8HOmz
    Cdkg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1697821757;
    s=strato-dkim-0003; d=goldelico.com;
    h=Message-Id:To:Cc:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=5RQJ1xl1yN+Oq3cuLl1q2ndUXnoeTOq+CMtNTlPjr2M=;
    b=qyeXTz2MGb9o8MtlXYgZhfPdeeMhIlsJ9M0JA6fLh7dCdEriupPERd7Ni89YEn/hQ/
    dDoiMtsIF8fwIru/y7Bg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGZijY="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 49.9.0 DYNA|AUTH)
    with ESMTPSA id 62efcaz9KH9HIsM
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Fri, 20 Oct 2023 19:09:17 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.4\))
Date:   Fri, 20 Oct 2023 19:09:17 +0200
Subject: TI git rep for omap5-sgx-ddk-um-linux.git not available
Cc:     letux-kernel@openphoenux.org
To:     openpvrsgx-devgroup@letux.org, linux-omap@vger.kernel.org
Message-Id: <2014DE2B-59DD-453F-9D89-682F6AA261D8@goldelico.com>
X-Mailer: Apple Mail (2.3696.120.41.1.4)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello,

I am experiencing problems trying to git clone or remote update

	https://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git

	Error: RPC failed; HTTP 403 curl 22 The requested URL returned =
error: 403

while

	https://git.ti.com/git/graphics/omap5-sgx-ddk-linux.git

worked until some days ago. Now it is also broken.

The cgit web page works:

	https://git.ti.com/cgit/graphics/omap5-sgx-ddk-um-linux

But opening the .git in a web browser returns "No repositories found".

Can someone confirm that the git repo work? Or knows someone responsible =
for it or how to notify TI?

BR and thanks,
Nikolaus

