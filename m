Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42DD54C6942
	for <lists+linux-omap@lfdr.de>; Mon, 28 Feb 2022 12:00:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbiB1LBQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Feb 2022 06:01:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230328AbiB1LBP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 28 Feb 2022 06:01:15 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 985692AFF
        for <linux-omap@vger.kernel.org>; Mon, 28 Feb 2022 03:00:37 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id vz16so24036910ejb.0
        for <linux-omap@vger.kernel.org>; Mon, 28 Feb 2022 03:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=I+F6yPZ34N1Ah2qwYuI3LKZXaTmqTxNo1AaNK4Mg4FA=;
        b=U7ECI4QyQHvEkP7MvADrh70L6LFd4ibqp1xQrovQsCfoe2XN2K3iUk5x2cY5j4Ub1W
         mnLxI74LGSnMxbLJBiQ+uv8T6ZpvzZUSJ2honh1acLNQeqYiox+sjtrqOlWaUIfWysq+
         iTPd53elBCeueGltrsFvHapqOW08bJNiVAP1LZDJodNgP2VKDXZunxwI44g6PEIvcXlX
         ErgMA4f1qmPzK0UuwIBFMBV5vEz2CUYXEGKv0PKDkOjaEn72dfLbPTm7OzKs+DnKw2XU
         9Z7N6ik7qofuhJiJpK450+r/xqxxniVxEcKZC+20c2Kvc3Wc6TMWAkCpCZbsozvywVEu
         CnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=I+F6yPZ34N1Ah2qwYuI3LKZXaTmqTxNo1AaNK4Mg4FA=;
        b=oXPDE4AzqAMdJitaYsTvMfH6nO7EGhF4wv94HMkiUGYJHv2GYmPCGkaqOjnN8qiSB4
         urmB/E6F+9kUT0LOGlvnlU3pfUqBQxghR4PbFW8DEsXhr0mlagLhHLsljFQLUWGNl+Hm
         mkJAFxUzTtwTFGW3FwGl9VHPudwqnR6I6Hri/IFRjBaLt/L9Ihj0tCY0YPOdEdjqm34T
         YG+sv8+iU+RKa0bIUMGwcr0ODyplVmpZPFz6eXM2fhtqzlA0ilCIMc+Vmebv+IiCZlLw
         kQll3GwT4UN6cExRm8t+FaIvk5V9RuNNU1EHqaaAAQGcnKyg8XPMH535rEfEuvXvuF6v
         Vulw==
X-Gm-Message-State: AOAM530mEzSSNevBQv3obUDVMPozeNFMMe3RIaDN7PNpmODjQNApoHus
        Z/APsiqce/WYw4PYcL/+DsI4cDgoNrWsXy17kr8=
X-Google-Smtp-Source: ABdhPJyVe77e20uXb3lPrzd6KeeQfNEUal9RHY6sppHld5GWo4iDTIWQxcSyy/mENSNOX7gCfCRdk0a33jxwpMGUxLs=
X-Received: by 2002:a17:906:2555:b0:6b7:5a75:b4f1 with SMTP id
 j21-20020a170906255500b006b75a75b4f1mr14329049ejb.60.1646046036212; Mon, 28
 Feb 2022 03:00:36 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:907:3e06:0:0:0:0 with HTTP; Mon, 28 Feb 2022 03:00:35
 -0800 (PST)
Reply-To: goodmanfred1414@gmail.com
From:   Goodman Fred <morganajohn17@gmail.com>
Date:   Mon, 28 Feb 2022 11:00:35 +0000
Message-ID: <CAKros7A9cAcuOx_sjB2E+km7XLxyn-d2UOQsAo_6N6Qyqi-VXQ@mail.gmail.com>
Subject: Attention: E-mail Address Owner:
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

-- 
Attention. I am contacting you for your restitution as a victim of
internet fraud. Where have you been? , Have you received it? if no ,
Reply if you are still active.Regards Goodman Fred.
